import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/Buttons/txt_btn.dart';

import '../../../widgets/Buttons/icon_btn.dart';

class ProfileOptionalWidget extends StatelessWidget {
  const ProfileOptionalWidget(
      {super.key,
      required this.iconImage,
      required this.titleOfTask,
      required this.onPressed,
      // required this.txtOfBtn,
      this.widget});
  final Widget iconImage;
  final String titleOfTask;
  final Function() onPressed;
  // final String txtOfBtn;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: iconImage),
            Text(titleOfTask, style: KAppTypoGraphy.descriptionMedium),
            const Spacer(),
            IconBtnWidget(
                btnColor: Colors.transparent,
                widget: const Icon(
                  Icons.keyboard_arrow_right,
                  color: KColors.txtColor,
                  size: 24,
                ),
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
