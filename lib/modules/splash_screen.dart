import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/modules/onboading_module/onboarding_screen.dart';
import 'package:todo_app/data/Constants/text_strings.dart';
import 'package:todo_app/data/Constants/theme.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      HelperFunctions.navigateToScreen(
          context: context, screen: OnBoardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 150.h, child: Image.asset(KAppAssets.todoLogo)),
            Text(KText.introTitle,
                // style: KAppTheme.textTheme.displayLarge,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
