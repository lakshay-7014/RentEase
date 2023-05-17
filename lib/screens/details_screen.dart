import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:minor/models/form_model.dart';
import 'package:minor/screens/pages/home_screen.dart';
import '../const/color_const.dart';
import '../views/dialogs/ui_help.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  final String category;
  final User firebaseuser;

  const Details(
      {super.key, required this.category, required this.firebaseuser});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File? imageFile;
  Color color = ColorConst.primaryColor;
  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();
  String dropdownValue = 'Per Day';

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
        compressQuality: 3,
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

  void showPhotoOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload Profile Image"),
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

  void checkvalue() {
    String name = namecontroller.text.trim();
    String price = pricecontroller.text.trim();
    String description = descriptioncontroller.text.trim();
    String location = locationcontroller.text.trim();
    String duration = durationcontroller.text.trim();

    if (name == "" ||
        price == "" ||
        description == "" ||
        location == "" ||
        duration == "") {
      UiHelper.showAlertDialog(
          context, "Data Incomplete", "All fields are not Completed");
    } else if (imageFile == null) {
      UiHelper.showAlertDialog(
          context, "Upload Image !!", "please select the image");
    } else {
      setdata(
          name: name,
          price: price,
          description: description,
          duration: duration,
          location: location);
    }
  }

  void setdata(
      {required String name,
      required String price,
      required String description,
      required String duration,
      required String location}) async {
    try {
      UiHelper.showloadingDialog(context, "Uploading ");
      DateTime now = DateTime.now();
      String filename = now.toString();
      UploadTask uploadtask = FirebaseStorage.instance
          .ref()
          .child('productpic/$filename')
          .putFile(imageFile!);
      TaskSnapshot snapshot = await uploadtask;
      String imageurl = await snapshot.ref.getDownloadURL();
      String uid = widget.firebaseuser.uid.toString();
      String cat = widget.category.toString();
      FormModel newform = FormModel(
          category: cat,
          productName: name,
          price: price,
          profilepic: imageurl,
          description: description,
          duration: duration,
          location: location,
          uid: uid);
      await FirebaseFirestore.instance
          .collection("product")
          .add(newform.toMap())
          .then((value) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen( category: "NULL",);
        }));
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
          //statusBarColor: Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(9 * 3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  "PRODUCT DETAILS",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageProfile(),
            nameTextField(),
            professionTextField(),
            durationfield(),
            Locationfield(),
            aboutTextField(),
            SizedBox(
              height: 10,
            ),
            submitfield(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CupertinoButton(
            onPressed: () {
              showPhotoOption();
            },
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageFile != null
                          ? FileImage(imageFile!)
                          : AssetImage('assets/images/default_image1.png')
                              as ImageProvider)),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitfield() {
    return Center(
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            checkvalue();
          },
          child: Text(
            "Upload",
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
    );
  }

  Widget Locationfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: locationcontroller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: color,
            )),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.location_on,
              color: color,
            ),
            labelText: "Location/city",
            labelStyle: TextStyle(color: ColorConst.primaryColor)
            //helperText: "Name can't be empty",
            ),
      ),
    );
  }

  Widget nameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: namecontroller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: color,
            )),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.adb_outlined,
              color: color,
            ),
            labelText: "Product_Name",
            labelStyle: TextStyle(color: ColorConst.primaryColor)
            //helperText: "Name can't be empty",
            ),
      ),
    );
  }

  Widget durationfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: durationcontroller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: ColorConst.primaryColor,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.access_time,
            color: color,
          ),
          labelText: "Duration",
          labelStyle: TextStyle(color: ColorConst.primaryColor),
          //helperText: "Per_Month",
        ),
      ),
    );
  }

  Widget professionTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: pricecontroller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: ColorConst.primaryColor,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.currency_rupee_outlined,
            color: color,
          ),
          labelText: "Price",
          labelStyle: TextStyle(color: ColorConst.primaryColor),
          //helperText: "Per_Month",
        ),
      ),
    );
  }

  Widget aboutTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: descriptioncontroller,
        maxLines: 5,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: color,
            width: 2,
          )),
          hintText: "Description about your product",
        ),
      ),
    );
  }
}
