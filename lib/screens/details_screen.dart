import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/src/painting/image_provider.dart';

import '../const/color_const.dart';

class Details extends StatefulWidget {
  final String category;

  const Details({super.key, required this.category});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File? imageFile;

  //final ImagePicker _picker = ImagePicker();
  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller= TextEditingController();
  TextEditingController descriptioncontroller= TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();
  void selectimage(ImageSource source) async {
    //  UiHelper.showloadingDialog(context, "Loading");
    try {
      XFile? pickedfile = await ImagePicker().pickImage(source: source);
      cropimage(pickedfile);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
      //UiHelper.showAlertDialog(context, "Error!", e.toString());
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

          print(imageFile);
        });
        //Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
      // UiHelper.showAlertDialog(context, "Error!te", e.toString());
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
                title: const Text("Select From Galary"),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 35,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //imageProfile(),
              // Center(
              //  // child: Text("Enter Details Of Product",

              //     style: TextStyle(
              //       color: Color(0xFF076E66),
              //       fontWeight: FontWeight.bold,
              //       fontSize: 22,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              imageProfile(),
              const SizedBox(
                height: 20,
              ),
              nameTextField(),
              const SizedBox(
                height: 20,
              ),
              professionTextField(),
              const SizedBox(
                height: 20,
              ),
              aboutTextField(),
              const SizedBox(
                height: 20,
              ),

              submitfield(),
            ],
          ),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,

                decoration: BoxDecoration(
                    image: DecorationImage(fit:BoxFit.fill ,
                        image: imageFile != null
                            ? FileImage(imageFile!)
                            : AssetImage('assets/images/img12.png')
                                as ImageProvider)),
                //backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                // backgroundImage: _imageFile == null
                //     ? AssetImage("assets/images/default_image1.png")
                //     : FileImage(_imageFile!) as ImageProvider,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 20.0,
          //   right: 34.0,
          //   child: InkWell(
          //     onTap: () {
          //       showModalBottomSheet(
          //           context: context, builder: (builder) => bottomSheet());
          //     },
          //     child: Icon(
          //       Icons.camera_alt,
          //       color: Color(0xFF076E66),
          //       size: 28,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  // Widget bottomSheet() {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           "Choose Profile photo",
  //           style: TextStyle(
  //             fontSize: 20.0,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  //           TextButton.icon(
  //             icon: Icon(Icons.camera),
  //             onPressed: () {
  //               takePhoto(ImageSource.camera);
  //             },
  //             label: Text("Camera"),
  //           ),
  //           TextButton.icon(
  //             icon: Icon(Icons.image),
  //             onPressed: () {
  //               takePhoto(ImageSource.gallery);
  //             },
  //             label: Text("Gallery"),
  //           ),
  //         ])
  //       ],
  //     ),
  //   );
  // }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = File! as File?;
  //   });
  // }

  Widget submitfield() {
    return Center(
      child: SizedBox(
        height: 50,
        width: 100,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Upload",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF076E66),
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blueAccent,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 2,
        )),
        // prefixIcon: Icon(
        //   Icons.present_to_all_sharp,
        //   color: Colors.blueAccent,
        // ),
        labelText: "Product_Name",
        //helperText: "Name can't be empty",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 2,
        )),
        // prefixIcon: Icon(
        //   Icons.monitor_heart,
        //   color: Colors.blueAccent,
        // ),
        labelText: "Price",
        helperText: "Per_Month",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
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
        hintText: "Description",

        //labelText: "Description",
        helperText: "Write about your product",
      ),
    );
  }
}
