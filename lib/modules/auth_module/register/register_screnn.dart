import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../../data/app_assets.dart';
import '../../../utiles/Constants/size.dart';
import '../../../utiles/helpers/helper_functions.dart';
import '../../../widgets/Buttons/trigar_btn.dart';
import '../../../widgets/Buttons/topBackBtn.dart';
import '../../../widgets/txtFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController userNameControler;
  late TextEditingController passwordControler;
  late TextEditingController conformPasswordControler;

  bool isPasswordShow = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameControler = TextEditingController();
    passwordControler = TextEditingController();
    conformPasswordControler = TextEditingController();
  }

  @override
  void dispose() {
    userNameControler.dispose();
    passwordControler.dispose();
    conformPasswordControler.dispose();
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
              controller: userNameControler,
              textInputType: TextInputType.emailAddress,
            ),
            TextWidget(
              text: 'Password',
              textStyle: KAppTypoGraphy.descriptionMedium,
              alignmentGeometry: Alignment.topLeft,
              padVerti: 5.w,
            ),
            TextFieldWidget(
              showSuffixPasswordIcon: true,
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
              controller: conformPasswordControler,
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
                padVerti: 15.w,
                widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
                btnName: 'Register',
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context: context, screen: const LoginScreen());
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
    );
  }
}
