import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

class AuthService {
  //login with pass and email function

  // LOGIN

  static loginWithEmailAndPassword(
      BuildContext context, var emailController, var passwordController) async {
    try {
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          scrollControlDisabledMaxHeightRatio: 10,
          sheetAnimationStyle: AnimationStyle(
            duration: Duration(milliseconds: 600),
          ),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height,
              maxWidth: MediaQuery.sizeOf(context).width),
          builder: (context) => Scaffold(
                body: Center(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator.adaptive(
                          valueColor:
                              AlwaysStoppedAnimation(Colors.amberAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
      // Get.back();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.back();
      Get.back();
    } catch (e) {
      Get.back();

      HelperFunctions.showToast(e.toString());
    }
  }

//  REGISTER
  static registerWithFirebaseAuth(
      BuildContext context, var emailController, var passwordController) async {
    try {
      showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height,
              maxWidth: MediaQuery.sizeOf(context).width),
          builder: (context) => const Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
              ));
      // Get.back();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.back();
      Get.back();
    } catch (e) {
      Get.back();

      HelperFunctions.showToast(e.toString());
    }
  }
}
