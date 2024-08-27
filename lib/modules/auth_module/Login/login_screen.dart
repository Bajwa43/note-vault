import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/modules/auth_module/Login/pages/forget_password.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/Constants/text_strings.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/utiles/app_validation.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtFieldWidget.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../../widgets/Buttons/topBackBtn.dart';
import '../../home_module/controller/task_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;
  var _tc = Get.find<TaskController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (kDebugMode) {
    //   emailController.text = "fahadali@gmail.com";
    //   passwordController.text = "Fahad@11";
    // }
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
                text: 'Login',
                textStyle: KAppTypoGraphy.displayTitleLarge,
                alignmentGeometry: Alignment.topLeft,
              ),
              TextWidget(
                text: 'UserName',
                textStyle: KAppTypoGraphy.descriptionMedium,
                alignmentGeometry: Alignment.topLeft,
                padVerti: 10.w,
              ),
              TextFieldWidget(
                hintText: 'UserName',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                // validation: (value) {
                //   if (!AppValidation.validateEmail(value!)) {
                //     return 'Invalid email address';
                //   }
                //   return null;
                // },
              ),
              TextWidget(
                text: 'Password',
                textStyle: KAppTypoGraphy.descriptionMedium,
                alignmentGeometry: Alignment.topLeft,
                padVerti: 10.w,
              ),
              TextFieldWidget(
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: isPasswordShow,
                // validation: (value) {
                //   if (!AppValidation.validatePassword(value ?? '')) {
                //     return 'Password must be at least 8 characters long and contain uppercase, lowercase, numbers, and special characters.';
                //   }
                //   return null;
                // },
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
              GestureDetector(
                onTap: () {
                  Get.to(ForgetPasswordScreen());
                },
                child: TextWidget(
                  alignmentGeometry: Alignment.topRight,
                  // padHori: 0,
                  padVerti: 0,
                  text: 'Forget password?',
                  textStyle: KAppTypoGraphy.descriptionMedium,
                ),
              ),
              TrigareBtn(
                  heightOfBtn: 48.h,
                  padVerti: 20.w,
                  widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                  btnName: 'LOGIN',
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    AuthService.loginWithEmailAndPassword(
                        context, emailController, passwordController);
                    // }
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
                  btnName: 'Login With Google',
                  onPressed: () {}),
              TrigareBtn(
                  heightOfBtn: 48.h,
                  showBothIconWithText: true,
                  icon: Image.asset(KAppAssets.appleLogo, width: 24.w),
                  padVerti: 0,
                  widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                  flatBtn: true,
                  btnName: 'Login With Apple',
                  onPressed: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      padHori: 0,
                      text: 'Dont have an account?',
                      textStyle: KAppTypoGraphy.descriptionHintTextMedium),
                  GestureDetector(
                    onTap: () {
                      HelperFunctions.navigateToScreen(
                          context: context, screen: const RegisterScreen());
                    },
                    child: TextWidget(
                        padHori: 0,
                        text: 'Register',
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
