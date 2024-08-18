import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/modules/home_module/pages/edit_task_screen/edit_task_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

class TaskCardWidget extends StatelessWidget {
  TaskCardWidget(
      {super.key,
      // required this.index,
      // required this.list,
      this.btnHide = false,
      // this.btnColor,
      required this.taskModel});
  // final int index;
  // final List<dynamic> list;
  final TaskModel taskModel;
  final btnHide;
  // final Color? btnColor;
  final TaskController tc = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = taskModel.dueDateTime;
    String time = DateFormat.jm().format(dateTime);
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    // String all = dateFormat.format(dateTime);

    // String myHour = time.substring(0, 2); // parse your string
    // String myMin = time.substring(2, 4);

    // log('>> ${myHour}${myMin}');
    // log(all);
    // log(myHour);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: InkWell(
        onTap: () {
          // log('>> IDM : ${taskModel.id.toString()}');
          // log('>> IDtc : ${tc.id.value.toString()}');

          tc.id.value = taskModel.id;
          tc.title.value = taskModel.title;
          tc.description.value = taskModel.description;
          tc.dueDate.value = taskModel.dueDate;
          tc.categoryName.value = taskModel.categoryName;
          tc.iconCodePoint.value = taskModel.iconCodePoint;
          tc.iconFontFamily.value = taskModel.iconFontFamily;
          tc.iconColorA.value = taskModel.iconColorA;
          tc.iconColorB.value = taskModel.iconColorB;
          tc.iconColorG.value = taskModel.iconColorG;
          tc.iconColorR.value = taskModel.iconColorR;
          tc.priorityLevel.value = taskModel.priorityLevel;
          tc.id.value = taskModel.id;
          tc.checkStatus.value =
              taskModel.status == TaskStatus.completed ? true : false;

          HelperFunctions.navigateToScreen(
              context: context, screen: const EditTaskScreen());
        },
        child: Container(
            width: 327.w,
            height: 72.h,
            decoration: BoxDecoration(
                color: KColors.bottomSheetColor,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SizedBox(
                      width: 16.w,
                      height: 16.h,
                      // child: SvgPicture.asset(KAppAssets.ringImage),
                      child: Checkbox(
                          fillColor: MaterialStatePropertyAll(
                              KColors.bottomSheetColor),
                          shape: const CircleBorder(),
                          value: taskModel.status == TaskStatus.completed
                              ? true
                              : false,
                          onChanged: (value) {}),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                            alignmentGeometry: Alignment.topLeft,
                            padVerti: 0,
                            padHori: 0,
                            text: taskModel.title,
                            textStyle: KAppTypoGraphy.descriptionMedium),
                        TextWidget(
                          alignmentGeometry: Alignment.topLeft,
                          padHori: 0,
                          padVerti: 0,
                          text: time,
                          textStyle: KAppTypoGraphy.dateTimeTextStyle14N,
                        ),
                      ]),
                  const Spacer(),
                  btnHide
                      ? const SizedBox.shrink()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TrigareBtn(
                                btnColor: Color.fromARGB(
                                    taskModel.iconColorA,
                                    taskModel.iconColorR,
                                    taskModel.iconColorG,
                                    taskModel.iconColorB),
                                heightOfBtn: 29.h,
                                widthOfBtn: null,
                                showBothIconWithText: true,
                                padOfIcon: EdgeInsets.all(1),
                                padText: EdgeInsets.all(3),
                                btnTextStyle:
                                    KAppTypoGraphy.descriptionTextMedium,
                                icon: Icon(
                                  IconData(taskModel.iconCodePoint,
                                      fontFamily: taskModel.iconFontFamily),
                                  size: 14.w,
                                  color: KColors.txtColor,
                                ),
                                // flatBtn: true,
                                btnName: taskModel.categoryName,
                                onPressed: () {}),
                          ),
                        ),
                  btnHide
                      ? SizedBox.shrink()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: TrigareBtn(
                              heightOfBtn: 29.h,
                              widthOfBtn: 60.w,
                              showBothIconWithText: true,
                              padOfIcon: EdgeInsets.all(0),
                              btnTextStyle:
                                  KAppTypoGraphy.descriptionHintTextMedium,
                              icon: Image.asset(KAppAssets.flagImage,
                                  width: 14.w, color: KColors.hintTxtColor),
                              flatBtn: true,
                              btnName: taskModel.priorityLevel.toString(),
                              onPressed: () {}),
                        )
                ],
              ),
            )),
      ),
    );
  }
}
