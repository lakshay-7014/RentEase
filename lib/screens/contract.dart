import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minor/models/contract_model.dart';
import 'package:minor/views/widgets/custom_appBar.dart';
import '../main.dart';
import '../models/user_model.dart';
import '../views/dialogs/ui_help.dart';

class Uploadcontract extends StatefulWidget {
  final User firebaseuser;
  final UserModel targetuser;

  const Uploadcontract(
      {super.key, required this.firebaseuser, required this.targetuser});

  @override
  State<Uploadcontract> createState() => _UploadcontractState();
}

class _UploadcontractState extends State<Uploadcontract> {
  File? imageFile;
  void selectimage(ImageSource source) async {
    UiHelper.showloadingDialog(context, "Loading");
    try {
      XFile? pickedfile = await ImagePicker().pickImage(source: source);
      cropimage(pickedfile);
    } catch (e) {
      Navigator.pop(context);
      UiHelper.showAlertDialog(context, "Error!", e.toString());
    }
  }

  void cropimage(XFile? file) async {
    try {
      CroppedFile? cropfile = await ImageCropper().cropImage(
        sourcePath: file!.path,
        compressQuality: 20,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );

      if (cropfile != null) {
        setState(() {
          imageFile = File(cropfile.path);

          //  print(imageFile);
        });
        Navigator.pop(context);
      }
    } catch (e) {
      //print(e.toString());
      UiHelper.showAlertDialog(context, "Error", e.toString());
    }
  }

  void checkvalue() {
    if (imageFile == null) {
      UiHelper.showAlertDialog(
          context, "Upload Image !!", "please select the image");
    } else {
      setdata();
    }
  }

  void setdata() async {
    try {
      UiHelper.showloadingDialog(context, "Uploading ");
      DateTime now = DateTime.now();
      String filename = now.toString();
      UploadTask uploadtask = FirebaseStorage.instance
          .ref()
          .child('contract/$filename')
          .putFile(imageFile!);
      TaskSnapshot snapshot = await uploadtask;
      String imageurl = await snapshot.ref.getDownloadURL();
      String uid1 = widget.firebaseuser.uid.toString();
      String uid2 = widget.targetuser.uid.toString();
      ContractModel contractmodel = ContractModel(
          chatroomid: uuid.v1(),
          contractpic: imageurl,
          participants: {uid1.toString(): true, uid2.toString(): true});
           await FirebaseFirestore.instance
          .collection("contract")
          .doc(contractmodel.chatroomid)
          .set(contractmodel.toMap());

          Navigator.pop(context);
          Navigator.pop(context);
    } catch (ex) {
      print(ex.toString());
      
    }
  }

  void showPhotoOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload Product Image"),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectimage(ImageSource.gallery);
                },
                title: const Text("Select From Gallary"),
                leading: const Icon(Icons.photo_album_outlined),
              ),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectimage(ImageSource.camera);
                  },
                  title: const Text("Select From Camera"),
                  leading: const Icon(Icons.camera_alt_outlined))
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(name: "UPLOAD CONTRACT"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
            onPressed: () {
              showPhotoOption();
            },
            child: Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageFile != null
                          ? FileImage(imageFile!)
                          : AssetImage('assets/images/default_image1.png')
                              as ImageProvider)),
            ),
          ),
          Center(
            child: SizedBox(
              // height:55,
              // width: 220,
              child: ElevatedButton(
                onPressed: () {
                 checkvalue();;
                },
                child: Text(
                  "Upload contract",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  primary: Color(0xFF076E66),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
