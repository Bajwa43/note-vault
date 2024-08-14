import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/Buttons/txt_btn.dart';

class TaskEditedItemsWidget extends StatelessWidget {
  const TaskEditedItemsWidget(
      {super.key,
      required this.iconImage,
      required this.titleOfTask,
      required this.onPressed,
      required this.txtOfBtn,
      this.widget,
      this.btnColor});
  final Widget iconImage;
  final String titleOfTask;
  final Function() onPressed;
  final String txtOfBtn;
  final Widget? widget;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: iconImage),
          Text(titleOfTask, style: KAppTypoGraphy.descriptionMedium),
          const Spacer(),
          TextButtonWidget(
            onTap: onPressed,
            nameOfBtn: txtOfBtn,
            widget: widget,
            btnColor: btnColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            btnStyle: KAppTypoGraphy.descriptionLarge,
            btnBorder: BorderRadius.circular(6.w),
          ),
        ],
      ),
    );
  }
}
