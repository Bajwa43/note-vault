import 'package:flutter/material.dart';

class HelperFunctions {
  static void popBack({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void navigateToScreen(
      {required BuildContext context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
