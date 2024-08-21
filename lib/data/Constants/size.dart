import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/Constants/colors.dart';

class KAppTypoGraphy {
  static final onBoadingTitleSize = 32.w;
  static final onBoadingDescriptionSize = 16.0.w;
  static final trigarLargeBtnWidth = 320.0.w;

  static TextStyle displayTitleLarge = TextStyle(
    color: KColors.txtColor,
    fontSize: 32.w,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayTitleMedium = TextStyle(
    color: KColors.txtColor,
    fontSize: 20.w,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayTitleSmall = TextStyle(
    color: KColors.txtColor,
    fontSize: 16.w,
    fontWeight: FontWeight.bold,
  );

  static TextStyle categoryTextStyle15M = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 15.w,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dayNumber14M = TextStyle(
    color: Colors.white,
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dayName15M = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 12.w,
    fontWeight: FontWeight.w400,
  );

  static TextStyle categoryTextStyle14M = TextStyle(
    color: KColors.txtColor,
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
  );

  static TextStyle descriptionLarge = TextStyle(
    color: KColors.txtColor,
    fontSize: 18.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle descriptionMedium = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle deleteBtnMedium = TextStyle(
    color: Colors.red,
    fontSize: 16.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle description2Medium = TextStyle(
    color: KColors.hintTxtColor,
    fontSize: 16.w,
    fontWeight: FontWeight.normal,
  );

  static TextStyle descriptionHintTextLarge = TextStyle(
    color: KColors.hintTxtColor,
    fontSize: 18.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle descriptionHintTextMedium = TextStyle(
    color: KColors.hintTxtColor,
    fontSize: 12.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle dateTimeTextStyle14N = TextStyle(
    color: KColors.hintTxtColor,
    fontSize: 14.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle Month14N = TextStyle(
    color: KColors.txtColor,
    fontSize: 14.w,
    fontWeight: FontWeight.normal,
  );

  static TextStyle descriptionTextMedium = TextStyle(
    color: KColors.txtColor,
    fontSize: 12.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle year10N = TextStyle(
    color: KColors.hintTxtColor,
    fontSize: 12.w,
    fontWeight: FontWeight.normal,
  );
  // .....

  static TextStyle profileTitleStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 20.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle profileNameStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 20.w,
    fontWeight: FontWeight.w500,
  );
  static TextStyle profileLabelStyle = TextStyle(
    color: Color(0xFFAFAFAF),
    fontSize: 14.w,
    fontWeight: FontWeight.normal,
  );
  static TextStyle profileOptionStyleAndBtnText = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.w,
    fontWeight: FontWeight.normal,
  );

  // .....Timer Coundown

  static TextStyle timerTextStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 40.w,
    fontWeight: FontWeight.w500,
  );

  static TextStyle dialogeText18Medium = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 18.w,
    fontWeight: FontWeight.w500,
  );
}
