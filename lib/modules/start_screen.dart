import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/Constants/text_strings.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

import '../widgets/Buttons/trigar_btn.dart';
import '../widgets/Buttons/topBackBtn.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopLeftBtn(onPressed: () {
            Get.back();
          }),
          _displayheaderText(),
          _descrptionText(),
          const Spacer(),
          _loginBtn(context),
          _createAccountBtn(context),
        ],
      ),
    );
  }

  Padding _displayheaderText() {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Text(
        KText.startScreenTitle1,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: KAppTypoGraphy.onBoadingTitleSize),
      ),
    );
  }

  Padding _descrptionText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
      child: Text(
        KText.startScreenDescription1,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: KAppTypoGraphy.onBoadingDescriptionSize),
      ),
    );
  }

  Padding _createAccountBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.w),
      child: TrigareBtn(
          heightOfBtn: 48.h,
          btnName: 'Create Account',
          onPressed: () {
            // HelperFunctions.navigateToScreen(
            //     context: context, screen: RegisterScreen());
            // Get.toNamed('/register');
            Get.to(const RegisterScreen());
          },
          widthOfBtn: 327.sp,
          flatBtn: true),
    );
  }

  Padding _loginBtn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
        child: TrigareBtn(
            btnName: 'LOGIN',
            heightOfBtn: 48.h,
            onPressed: () {
              // HelperFunctions.navigateToScreen(
              //     context: context, screen: LoginScreen());
              // Get.toNamed('/login');
              Get.to(const LoginScreen());
            },
            widthOfBtn: 327.sp));
  }
}
