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
            SizedBox(
              height: 20,
            ),
            priceTextField(),
            durationfield(),
            Locationfield(),
            aboutTextField(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('assets/images/default_image1.png')
              as ImageProvider)),
    );
  }
  Widget Locationfield() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text("Location",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text("PRODUCT_NAME",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget durationfield() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text("Duration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget priceTextField() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text("Price/day",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget aboutTextField() {
    return Container(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text("Description",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            height: 1,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}