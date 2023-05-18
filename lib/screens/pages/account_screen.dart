import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/screens/pages/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_provider.dart';
import '../../const/color_const.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
          //statusBarColor: Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  "PROFILE",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: 10), //10
              height: 250, //140
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  //  width:1, //8
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/default_image1.png"),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Akshay Gehlot",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, // 22
                color: Colors.black,
              ),
            ),
            Text(
              "___________________________\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, // 22
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "E-mail",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "gehlotakshay10@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Jaipur, Rajasthan(pin-302022)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            submitfield(context),
          ],
        ),
      ),
    );
  }

  Widget submitfield(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Center(
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            ap.userSignOut().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  ),
                );
          },
          child: Text(
            "Log-out",
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
}
