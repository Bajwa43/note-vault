import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFunctions {
  static void popBack({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void navigateToScreen(
      {required BuildContext context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        // gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
