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

  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

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
        //compressQuality: 3,
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
       UiHelper.showAlertDialog(context, "Error!te", e.toString());
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

    if (name == "" || price == "" || description == "") {
      UiHelper.showAlertDialog(
          context, "Data Incomplete", "All fields are not Completed");
    } else if(imageFile==null){
       UiHelper.showAlertDialog(
          context, "Data Incomplete", "please select the image");
    }
    else {
      setdata(name: name, price: price, description: description);
    }
  }

  void setdata(
    
      {required String name,
      required String price,
      required String description}) async {
      
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
          uid: uid);
      await FirebaseFirestore.instance
          .collection("product")
          .add(newform.toMap())
          .then((value) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
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
            Locationfield(),
            professionTextField(),

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
              height: 250,
              width: double.infinity,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: imageFile != null
                          ? FileImage(imageFile!)
                          : AssetImage('assets/images/img12.png')
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
        controller: namecontroller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueAccent,
          )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.blueAccent,
          ),
          labelText: "Location/city",
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueAccent,
          )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          // prefixIcon: Icon(
          //   Icons.present_to_all_sharp,
          //   color: Colors.blueAccent,
          // ),
          labelText: "Product_Name",
          //helperText: "Name can't be empty",
        ),
      ),
    );
  }

  Widget professionTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: pricecontroller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: ColorConst.primaryColor,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.currency_rupee_outlined,
            color: ColorConst.primaryColor,
          ),
          labelText: "Price",
          labelStyle: TextStyle(color: ColorConst.primaryColor)
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
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          )),
          hintText: "Description about your product",
          //labelText: "Description",
          //helperText: "Write about your product",
        ),
      ),
    );
  }
}
