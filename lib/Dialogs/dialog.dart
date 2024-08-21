import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/Constants/colors.dart';
import '../data/Constants/size.dart';
import '../widgets/Buttons/trigar_btn.dart';
import '../widgets/txtWidget.dart';

class DialogWidget extends StatelessWidget {
  final Function() onPressed;

  final Function() onCanceled;

  final Widget? widget;

  const DialogWidget(
      {super.key,
      required this.trigarBtnName,
      required this.dialogTitle,
      required this.onPressed,
      required this.onCanceled,
      this.widget,
      required this.heightOfDialog});

  final String trigarBtnName;
  final String dialogTitle;
  final double heightOfDialog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      // height: 360.h,
      height: heightOfDialog,
      decoration: BoxDecoration(
          color: KColors.bottomSheetColor,
          borderRadius: BorderRadius.circular(4.w)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWidget(
                padVerti: 0.w,
                text: dialogTitle,
                textStyle: KAppTypoGraphy.displayTitleSmall),
            // .......
            Divider(
              endIndent: 8.w,
              indent: 8.w,
              color: KColors.dividerColor,
              height: 25.h,
              thickness: 2.w,
            ),

            widget ?? const SizedBox.shrink(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TrigareBtn(
                    heightOfBtn: 48.h,
                    widthOfBtn: 125.w,
                    flatBtn: true,
                    flatBorderColor: Colors.transparent,
                    btnName: 'cancel',
                    btnTextStyle: TextStyle(
                        color: KColors.btn,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                    onPressed: onCanceled),
                TrigareBtn(
                    heightOfBtn: 48.h,
                    widthOfBtn: 125.w,
                    btnName: trigarBtnName,
                    onPressed: onPressed),
              ],
            )
          ],
        ),
      ),
    );
  }
}
