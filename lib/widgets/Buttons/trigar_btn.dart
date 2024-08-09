// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/utiles/Constants/colors.dart';

class TrigareBtn extends StatelessWidget {
  const TrigareBtn(
      {Key? key,
      this.widthOfBtn = 90,
      required this.btnName,
      required this.onPressed,
      this.flatBtn = false,
      this.padVerti,
      this.showJustIcon = false,
      this.showBothIconWithText = false,
      this.showCircle = false,
      this.inkWellEffectForCircleBtn = false,
      this.icon = const Icon(Icons.add),
      this.btnTextStyle = const TextStyle(color: Colors.white, fontSize: 16),
      this.flatBorderColor = KColors.btn,
      this.heightOfBtn,
      this.padOfIcon,
      this.padText,
      this.btnColor})
      : super(key: key);

  final double? widthOfBtn;
  final String btnName;
  final VoidCallback onPressed;
  final bool flatBtn;
  final double? padVerti;
  final bool showJustIcon;
  final bool showBothIconWithText;
  final Widget icon;
  final bool showCircle;
  final bool inkWellEffectForCircleBtn;
  final TextStyle btnTextStyle;
  final Color flatBorderColor;
  final double? heightOfBtn;
  final EdgeInsetsGeometry? padOfIcon;
  final EdgeInsetsGeometry? padText;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: padVerti == null ? 10.w : padVerti!.w),
      child: InkWell(
        borderRadius: inkWellEffectForCircleBtn
            ? BorderRadius.circular(50.w)
            : BorderRadius.circular(10.w),
        onTap: onPressed,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: widthOfBtn,
          // height: 48.h,
          height: heightOfBtn ?? heightOfBtn,
          decoration: flatBtn
              ? BoxDecoration(
                  border: Border.all(color: flatBorderColor, width: 3.sp),
                  borderRadius: BorderRadius.circular(10.w),

                  //  color:
                )
              : showCircle
                  ? const BoxDecoration(
                      shape: BoxShape.circle, color: KColors.btn)
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),

                      color: btnColor ?? KColors.btn,
                      // color: Colors.blueAccent
                    ),
          child: Center(
              child: showBothIconWithText
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: padOfIcon == null
                              ? EdgeInsets.symmetric(horizontal: 10.w)
                              : padOfIcon!,
                          child: icon,
                        ),
                        Padding(
                          padding:
                              padText == null ? EdgeInsets.all(0) : padText!,
                          child: Text(
                            btnName,
                            style: btnTextStyle,
                          ),
                        )
                      ],
                    )
                  : showJustIcon
                      ? icon
                      : Padding(
                          padding:
                              padText == null ? EdgeInsets.all(0) : padText!,
                          child: Text(
                            btnName,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        )),
        ),
      ),
    );
  }
}
