import 'package:flutter/material.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

class IconBtnWidget extends StatelessWidget {
  const IconBtnWidget(
      {super.key,
      required this.widget,
      required this.onTap,
      this.padLeft = 0,
      this.padRight = 0,
      this.padTop = 0,
      this.padBottom = 0,
      this.btnColor,
      this.btnBorder});

  final Widget widget;
  final Function() onTap;
  final double padLeft;
  final double padRight;
  final double padTop;
  final double padBottom;
  final Color? btnColor;
  final BorderRadiusGeometry? btnBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: padBottom, left: padLeft, right: padRight, top: padTop),
      child: Material(
        child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    color:
                        btnColor == null ? KColors.bottomSheetColor : btnColor,
                    borderRadius: btnBorder),
                child: widget)),
      ),
    );
  }
}
