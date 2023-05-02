import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/string_const.dart';

class Dialogs {
  static circularProgressIndicatorDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  //TODO:

  static defaultDialog1(String errorText) {
    return Get.defaultDialog(
      title: StringConst.error,
      middleText: errorText,
    );
  }

  static defaultDialog2(String title, String middleText) {
    return Get.defaultDialog(
      title: title,
      middleText: middleText,
    );
  }
  //TODO:
}
