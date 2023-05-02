import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../const/color_const.dart';
import '../../../const/image_const.dart';
import '../../../utils/app_sizes.dart';

AppBar appBar3 = AppBar(
  elevation: 0,
  centerTitle: true,
  toolbarHeight: AppSizes.height10 * 8.5,
  backgroundColor: ColorConst.primaryColor,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(AppSizes.height10 * 3),
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
