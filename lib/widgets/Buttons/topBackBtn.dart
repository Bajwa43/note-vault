import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLeftBtn extends StatelessWidget {
  const TopLeftBtn(
      {super.key,
      required this.onPressed,
      this.isText = false,
      this.isTextThenBtnName = 'Skip',
      this.isOffPad = false});

  final VoidCallback onPressed;
  final bool isText;
  final String isTextThenBtnName;
  final bool isOffPad;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: isOffPad
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 20.w, top: 50.w),
          child: isText
              ? Text(
                  isTextThenBtnName,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                )
              : Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                  size: 30.sp,
                ),
        ),
      ),
    );
  }
}
