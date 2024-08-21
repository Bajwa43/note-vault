import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';

import '../../data/Constants/size.dart';

class NegativeBtnWithIconWidget extends StatelessWidget {
  const NegativeBtnWithIconWidget(
      {super.key,
      required this.onPressed,
      required this.btnText,
      required this.widget});

  final Function() onPressed;
  final String btnText;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return TrigareBtn(
        btnTextStyle: KAppTypoGraphy.deleteBtnMedium,
        flatBorderColor: Colors.transparent,
        flatBtn: true,
        showBothIconWithText: true,
        icon: SizedBox(
          // width: 24.w,
          // height: 24.h,
          child: widget,
          // child: Icon(
          //   Icons.delete_outline_outlined,
          //   color: Colors.red,
          //   size: 24.w,
          // )
        ),
        padOfIcon: EdgeInsets.all(0),
        padText: EdgeInsets.all(0),
        widthOfBtn: 120.w,
        heightOfBtn: 24.h,
        btnName: btnText,
        onPressed: onPressed);
  }
}
