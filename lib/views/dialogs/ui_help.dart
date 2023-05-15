import 'package:flutter/material.dart';

class UiHelper {
  static void showloadingDialog(BuildContext context, String title) {
    AlertDialog loadingdialog = AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(title),
          ],
        ),
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return loadingdialog;
        });
  }

  static void showAlertDialog(
      BuildContext context, String title, String content) {
    AlertDialog alertdialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertdialog;
        });
        
  }
}
