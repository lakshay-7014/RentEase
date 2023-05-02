import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/color_const.dart';
import '../../../const/font_const.dart';
import '../../../utils/app_sizes.dart';

class CustomTitle1 extends StatelessWidget {
  const CustomTitle1({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: ColorConst.primaryColor,
            size: AppSizes.height10 * 3.6,
          ),
          onTap: () {
            Get.back();
          },
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSizes.height10 * 2.4,
              fontWeight: FontWeight.bold,
              //  fontFamily: FontConst.nunitoSans,
            ),
          ),
        )
      ],
    );
  }
}
