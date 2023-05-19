import 'package:flutter/material.dart';

import '../../screens/pages/home_screen.dart';

void navigateto({required BuildContext context, required String cat}) {
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return HomeScreen(
          category: cat,
        );
      },
    ),
  );
}

Widget filter(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      width: 90,
      height: 90,
      child: ListView(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Cars");
            },
            child: Container(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img1.png',
                  ),
                  Text("Cars")
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Properties");
            },
            child: Container(
              width: 50,
              height: 50,
              child: Column(
                children: [Image.asset('assets/images/img2.png'), Text("Home")],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Mobiles");
            },
            child: Container(
              width: 52,
              height: 50,
              child: Column(
                children: [
                  Image.asset('assets/images/img3.png'),
                  Text("Mobiles")
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Books");
            },
            child: Container(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Image.asset('assets/images/img9.png'),
                  Text("Books")
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Bikes");
            },
            child: Container(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Image.asset('assets/images/img5.png'),
                  Text("Bikes")
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              navigateto(context: context, cat: "Sports");
            },
            child: Container(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Image.asset('assets/images/img10.png'),
                  Text("Sports")
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
