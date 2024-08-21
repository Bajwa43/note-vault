import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/Constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.padhori = 20,
      required this.hintText,
      this.hintColor = KColors.hintTxtColor,
      this.txtColor = KColors.txtColor,
      this.padverti = 10,
      this.textInputType = TextInputType.text,
      required this.controller,
      this.obscureText = false,
      this.showSuffixPasswordIcon = false,
      this.onPressedIcon,
      this.showPrefixIcon = false,
      this.prefixIconifTrue = const Icon(Icons.home),
      this.validation});
  final double padhori;
  final double padverti;
  final String hintText;
  final Color hintColor;
  final Color txtColor;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final bool showSuffixPasswordIcon;
  final bool showPrefixIcon;
  final Icon prefixIconifTrue;
  final Function()? onPressedIcon;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padhori.w, vertical: padverti.w),
      child: TextFormField(
        validator: validation,
        cursorColor: KColors.hintTxtColor,
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(color: txtColor),
        decoration: InputDecoration(
          prefixIcon: showPrefixIcon ? prefixIconifTrue : null,
          suffixIcon: showSuffixPasswordIcon
              ? GestureDetector(
                  onTap: onPressedIcon,
                  child: obscureText
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility),
                )
              : null,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
            borderSide: BorderSide(
                color: KColors.hintTxtColor,
                width: 2.w,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter),
          ),
          // fillColor: KColors.inerTextFieldColor,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
        ),
      ),
    );
  }
}
