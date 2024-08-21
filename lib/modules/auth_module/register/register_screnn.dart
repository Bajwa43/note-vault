import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/Constants/text_strings.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/utiles/app_validation.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../../data/app_assets.dart';
import '../../../data/Constants/size.dart';
import '../../../data/helpers/helper_functions.dart';
import '../../../widgets/Buttons/trigar_btn.dart';
import '../../../widgets/Buttons/topBackBtn.dart';
import '../../../widgets/txtFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController conformPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;
  bool isRegistering = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TopLeftBtn(
                  onPressed: () => HelperFunctions.popBack(context: context)),
              TextWidget(
                padVerti: 5,
                text: 'Register',
                textStyle: KAppTypoGraphy.displayTitleLarge,
                alignmentGeometry: Alignment.topLeft,
              ),
              TextWidget(
                text: 'UserName',
                textStyle: KAppTypoGraphy.descriptionMedium,
                alignmentGeometry: Alignment.topLeft,
                padVerti: 5.w,
              ),
              TextFieldWidget(
                  hintText: 'UserName',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  validation: (value) {
                    if (!AppValidation.validateEmail(value!)) {
                      return 'Invalid email address';
                    }
                    return null;
                  }),
              TextWidget(
                text: 'Password',
                textStyle: KAppTypoGraphy.descriptionMedium,
                alignmentGeometry: Alignment.topLeft,
                padVerti: 5.w,
              ),
              TextFieldWidget(
                showSuffixPasswordIcon: true,
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: isPasswordShow,
                // showIcon: true,
                validation: (value) {
                  if (!AppValidation.validatePassword(value ?? '')) {
                    return 'Password must be at least 8 characters long and contain uppercase, lowercase, numbers, and special characters.';
                  }
                  return null;
                },
                onPressedIcon: () {
                  if (isPasswordShow == true) {
                    isPasswordShow = false;
                  } else {
                    isPasswordShow = true;
                  }

                  setState(() {});
                },
              ),
              // .,.....................CONFORM PASSWORD FIELD
              TextWidget(
                text: 'Conform Password',
                textStyle: KAppTypoGraphy.descriptionMedium,
                alignmentGeometry: Alignment.topLeft,
                padVerti: 5.w,
              ),
              TextFieldWidget(
                showSuffixPasswordIcon: true,
                hintText: '* * * * * * * * * *',
                controller: conformPasswordController,
                obscureText: isPasswordShow,
                validation: (value) {
                  if (!AppValidation.validatePassword(value ?? '') &&
                      passwordController.text !=
                          conformPasswordController.text) {
                    return 'Password Not Match';
                  }
                  return null;
                },
                // showIcon: true,
                onPressedIcon: () {
                  if (isPasswordShow == true) {
                    isPasswordShow = false;
                  } else {
                    isPasswordShow = true;
                  }

                  setState(() {});
                },
              ),
              TrigareBtn(
                  heightOfBtn: 48.h,
                  padVerti: 15.w,
                  widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                  btnName: 'Register',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthService.registerWithFirebaseAuth(
                          context, emailController, passwordController);
                    }
                    // HelperFunctions.navigateToScreen(
                    //     context: context, screen: const LoginScreen());
                  }),
              Divider(
                endIndent: 15.w,
                indent: 15.w,
                color: KColors.hintTxtColor,
                height: 2,
                thickness: 2.sp,
              ),
              SizedBox(
                height: 10.w,
              ),
              TrigareBtn(
                  heightOfBtn: 48.h,
                  showBothIconWithText: true,
                  icon: Image.asset(
                    KAppAssets.googleLogo,
                    width: 24.w,
                  ),
                  widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                  flatBtn: true,
                  btnName: 'Register With Google',
                  onPressed: () {}),
              TrigareBtn(
                  heightOfBtn: 48.h,
                  showBothIconWithText: true,
                  icon: Image.asset(KAppAssets.appleLogo, width: 24.w),
                  padVerti: 0,
                  widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                  flatBtn: true,
                  btnName: 'Register With Apple',
                  onPressed: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      padHori: 0,
                      text: 'Already have an account?',
                      textStyle: KAppTypoGraphy.descriptionHintTextMedium),
                  GestureDetector(
                    onTap: () {
                      HelperFunctions.popBack(context: context);
                      // HelperFunctions.navigateToScreen(
                      // context: context, screen: LoginScreen());
                    },
                    child: TextWidget(
                        padHori: 0,
                        text: 'Login',
                        textStyle: KAppTypoGraphy.descriptionMedium),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
