import 'package:flutter/material.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

class CombineButtonWidget extends StatelessWidget {
  const CombineButtonWidget(
      {super.key,
      this.widthOfBtn = 76,
      this.heightOfBtn = 31,
      this.btnBorder = 6,
      this.btnColor = KColors.taskboxColor,
      this.widget =
          const Icon(Icons.keyboard_arrow_down, color: KColors.txtColor),
      required this.btnText,
      this.btnTextStyle =
          const TextStyle(color: KColors.txtColor, fontSize: 12),
      required this.onTap});
  final double widthOfBtn;
  final double heightOfBtn;
  final double btnBorder;
  final Color btnColor;
  final Widget widget;
  final String btnText;
  final TextStyle btnTextStyle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: widthOfBtn,
        height: heightOfBtn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(btnBorder), color: btnColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(btnText, style: btnTextStyle),
            widget,
          ],
        ),
      ),
    );
  }
}
