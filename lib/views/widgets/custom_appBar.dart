import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/color_const.dart';

AppBar appbar({required String name}) {
  return AppBar(
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
        // Image.asset(
        //   ImageConst.appLogo,
        //   height: AppSizes.height10 * 9,
        // ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            //SizedBox(height: AppSizes.height10 * 1.5),
            // Image.asset(
            //   ImageConst.appLogo,
            //   height: AppSizes.height10 * 2.7,
            // ),
          ],
        ),
      ],
    ),
  );
}
