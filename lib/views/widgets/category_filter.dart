import 'package:flutter/material.dart';
Widget filter() {
  return Container(
    width: 90,
    height: 90,
    child: ListView(
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
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
        SizedBox(
          width: 40,
        ),
        Container(
          width: 50,
          height: 50,
          child: Column(
            children: [Image.asset('assets/images/img2.png'), Text("Home")],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          width: 52,
          height: 50,
          child: Column(
            children: [Image.asset('assets/images/img3.png'), Text("Mobiles")],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          width: 50,
          height: 50,
          child: Column(
            children: [Image.asset('assets/images/img4.png'), Text("Jobs")],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          width: 50,
          height: 50,
          child: Column(
            children: [Image.asset('assets/images/img5.png'), Text("Bikes")],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          width: 50,
          height: 50,
          child: Column(
            children: [
              Image.asset('assets/images/img6.png'),
              Text("Electronics")
            ],
          ),
        ),
      ],
    ),
  );
}
