import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSizes {
  static double height10 = 0.0;
  static double width10 = 0.0;

  static void mediaQueryHeightWidth(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    height10 = Get.mediaQuery.size.height * 0.0118;
    width10 = Get.mediaQuery.size.width * 0.0118 * 2.1;
  }
  //

  static EdgeInsets padding10 =
      EdgeInsets.symmetric(horizontal: height10, vertical: height10);

  static EdgeInsets horizontalPadding10 =
      EdgeInsets.symmetric(horizontal: height10);

  static EdgeInsets horizontalPadding20 =
      EdgeInsets.symmetric(horizontal: height10 * 2);

  static EdgeInsets verticalPadding10 =
      EdgeInsets.symmetric(vertical: height10);
}
