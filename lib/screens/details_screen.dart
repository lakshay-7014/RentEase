import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/src/painting/image_provider.dart';
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File? _imageFile;
  //File? image;
  final ImagePicker _picker = ImagePicker();
  @override
  TextEditingController _name = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),

        children: <Widget>[
          //imageProfile(),
          Center(
            child: Text("Enter Details Of Product",

              style: TextStyle(
                color: Color(0xFF076E66),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          imageProfile(),
          SizedBox(
            height: 20,
          ),
          nameTextField(),
          SizedBox(
            height: 20,
          ),
          professionTextField(),
          SizedBox(
            height: 20,
          ),
          aboutTextField(),
          SizedBox(
            height: 20,
          ),

          submitfield(),
        ],
      ),
    );
  }
  Widget imageProfile(){
    return Center(
      child: Stack(
        children:[
          CircleAvatar(
            radius: 90,

            backgroundImage: _imageFile==null ? AssetImage("assets/images/default_image1.png") : FileImage(_imageFile!) as ImageProvider,
          ),
          Positioned(
            bottom: 20.0,
            right: 34.0, child: InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (builder)=>bottomSheet());
            },
            child: Icon(Icons.camera_alt,
              color: Color(0xFF076E66),
              size: 28,
            ),
          ),
          )
        ],
      ),
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text("Camera"),
                ),
                TextButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text("Gallery"),
                ),
              ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = File! as File?;
    });
  }

  Widget submitfield(){
    return Center(
      child: SizedBox(
        height: 50,
        width: 100,
        child: ElevatedButton(onPressed: (){}, child:
        Text("Post",
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
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            )),
        labelText: "Description",
        helperText: "Write about your product",
      ),
    );
  }



}
