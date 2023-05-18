import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/views/widgets/custom_appBar.dart';

import '../../const/color_const.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
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
                  "Product Name",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            imageProfile(),
            Container(

              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    aboutTextField(),
                    SizedBox(height: 10,),
                    priceTextField(),
                    SizedBox(height: 10,),
                    durationfield(),
                    SizedBox(height: 10,),
                    Locationfield(),
                    SizedBox(height: 30,),
                    chatbutton(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
  Widget chatbutton(){
    return Center(
      child: SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text(
            "Chat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: ColorConst.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('assets/images/college2.jpeg')
              as ImageProvider)),
    );
  }
  Widget Locationfield() {
    return   Text("Location",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              height: 1,
              letterSpacing: 2,
            ),
    );
  }

  Widget nameTextField() {
    return  Text("PRODUCT_NAME",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
    );
  }

  Widget durationfield() {
    return  Text("Duration",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
    );
  }

  Widget priceTextField() {
    return  Text("Price",
      //textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
    );
  }

  Widget aboutTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",
          //textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
        Text("The bike is fitted with sturdy 26-inch wheels, which provide stability and control on various surfaces. The tires have a moderate tread pattern, striking a balance between efficient road riding and light off-road capability. ",
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1,
                letterSpacing: 2,
              ),
        ),
      ],
    );
  }
}