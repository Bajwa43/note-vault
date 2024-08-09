import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/Constants/text_strings.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtFieldWidget.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../../widgets/Buttons/topBackBtn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameControler;
  late TextEditingController passwordControler;

  bool isPasswordShow = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameControler = TextEditingController();
    passwordControler = TextEditingController();
  }

  @override
  void dispose() {
    userNameControler.dispose();
    passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SingleChildScrollView(
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
              controller: userNameControler,
              textInputType: TextInputType.emailAddress,
            ),
            TextWidget(
              text: 'Password',
              textStyle: KAppTypoGraphy.descriptionMedium,
              alignmentGeometry: Alignment.topLeft,
              padVerti: 10.w,
            ),
            TextFieldWidget(
              hintText: '* * * * * * * * * *',
              controller: passwordControler,
              obscureText: isPasswordShow,
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
                padVerti: 20.w,
                widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                btnName: 'LOGIN',
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context: context, screen: const HomeScreen());
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
    );
  }
}
