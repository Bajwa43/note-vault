import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/Dialogs/dialog.dart';
import 'package:todo_app/Dialogs/inform_dialog.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/models/user_model.dart/user_model.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/services/auth_exception_handler.dart';
import 'package:todo_app/widgets/txtWidget.dart';

class AuthService {
  // static late AuthStatus _status;
  //login with pass and email function

  // FORGET PASSWORD
  static Future forgetPasswordWithEmail(
      String email, BuildContext context) async {
    // FirebaseAuth.instance.confirmPasswordReset(code: code, newPassword: newPassword)
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
      (value) {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: InformDialogWidget(
                    heightOfDialog: 200.h,
                    trigarBtnName: 'Ok',
                    dialogTitle: 'Email Conformation!',
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    child: TextWidget(
                      padHori: 0,
                      padVerti: 0,
                      text: 'Message send your Email box! If it is Exist.',
                      textStyle: KAppTypoGraphy.dialogeText18Medium,
                      textAlign: TextAlign.center,
                    ),
                    //
                  ),
                ));
      },
    );
    //  .then(
    // (value) {
    //   _status == AuthStatus.successful;
    //   // Get.to();
    // },
    // );
  }

  // LOGIN

  static loginWithEmailAndPassword(
      BuildContext context, var emailController, var passwordController) async {
    try {
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          scrollControlDisabledMaxHeightRatio: 10,
          sheetAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 600),
          ),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height,
              maxWidth: MediaQuery.sizeOf(context).width),
          builder: (context) => Scaffold(
                body: Center(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1,
                    child: const Column(
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
      // Get.back();
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.back();
      AuthStatus status = AuthExceptionHandler.handleAuthException(e);
      String error = AuthExceptionHandler.generateErrorMessage(status);
      HelperFunctions.showToast(error);
    }
  }

//  REGISTER
  static registerWithFirebaseAuth(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
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

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // TaskModel(
      //     id: '',
      //     title: '',
      //     description: '',
      //     dueDate: DateTime.now(),
      //     dueDateTime: DateTime.now(),
      //     updateAt: DateTime.now(),
      //     createdAt: DateTime.now(),
      //     iconCodePoint: 0,
      //     iconFontFamily: '',
      //     iconColorA: 0,
      //     iconColorB: 0,
      //     iconColorG: 0,
      //     iconColorR: 0,
      //     priorityLevel: 0,
      //     categoryName: '',
      //     status: TaskStatus.inprogress);

      UserModel userModel = UserModel(
          userName: emailController.text.split('@').first, imagePath: '');
      await HelperFirebase.userInstance
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());

      // .collection('Tasks');
      // .doc();
      // .set();
      Get.back();
      Get.back();
    } catch (e) {
      Get.back();

      HelperFunctions.showToast(e.toString());
    }
  }
}
