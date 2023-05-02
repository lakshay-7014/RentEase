import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/color_const.dart';
import '../../../const/image_const.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_sizes.dart';

// double _getHeight(BuildContext context) {
//   final mediaquery=  MediaQuery.of(context);
//   return mediaquery.size.height*0.0118;
// }

AppBar appBar2 = AppBar(
  automaticallyImplyLeading: false,
  elevation: 0,
  centerTitle: true,
  toolbarHeight: 35,
  backgroundColor: ColorConst.primaryColor,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
    //statusBarColor: Colors.transparent,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(9 * 3),
    ),
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        ImageConst.appLogo,
        height: AppSizes.height10 * 9,
      ),
      Column(
        children: [
          Text(
            "RENTEASE",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: AppSizes.height10 * 1.5),
          Image.asset(
            ImageConst.appLogo,
            height: AppSizes.height10 * 2.7,
          ),
        ],
      ),
    ],
  ),
);
