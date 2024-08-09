import 'package:flutter/material.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

class TextButtonWidget extends StatelessWidget {
  final Function() onTap;
  final Color? btnColor;
  final BorderRadiusGeometry? btnBorder;
  final String nameOfBtn;
  final TextStyle btnStyle;
  final Widget? widget;

  final EdgeInsetsGeometry padding;
  const TextButtonWidget(
      {super.key,
      required this.onTap,
      this.btnColor,
      this.btnBorder,
      required this.nameOfBtn,
      required this.padding,
      required this.btnStyle,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: btnColor ?? KColors.bottomSheetColor,
                borderRadius: btnBorder),
            child: Padding(
                padding: padding,
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget ?? SizedBox.shrink(),
                      Text(nameOfBtn, style: btnStyle)
                    ]))));
  }
}
