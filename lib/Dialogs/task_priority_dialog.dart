import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/task_priority_model.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../data/Constants/colors.dart';

// int checkedIndex = 0;

class TaskPriorityDialog extends StatefulWidget {
  const TaskPriorityDialog(
      {super.key,
      required this.trigarBtnName,
      required this.onCanceled,
      required this.onPressed});
  final String trigarBtnName;
  final Function() onCanceled;
  final Function(int level) onPressed;

  @override
  State<TaskPriorityDialog> createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<TaskPriorityDialog> {
  // int priorityLevel;
  final TaskController tc = Get.find<TaskController>();

  int priorityLevel = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 327.w,
        height: 360.h,
        decoration: BoxDecoration(
            color: KColors.bottomSheetColor,
            borderRadius: BorderRadius.circular(4.w)),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                  padVerti: 10.w,
                  text: 'Task Priority',
                  textStyle: KAppTypoGraphy.displayTitleSmall),
              // .......
              Divider(
                endIndent: 8.w,
                indent: 8.w,
                color: KColors.dividerColor,
                height: 25.h,
                thickness: 2.w,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: TaskPriorityModel.listOfTaskPriority.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 6.w,
                    mainAxisSpacing: 16.w,
                    // childAspectRatio: 10
                  ),
                  itemBuilder: (context, index) {
                    return buildWidget(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TrigareBtn(
                      heightOfBtn: 48.h,
                      widthOfBtn: 125.w,
                      flatBtn: true,
                      btnName: 'cancel',
                      onPressed: widget.onCanceled),
                  TrigareBtn(
                    heightOfBtn: 48.h,
                    widthOfBtn: 125.w,
                    btnName: widget.trigarBtnName,
                    onPressed: () {
                      widget.onPressed(priorityLevel);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildWidget(int index) {
    tc.check.value = index == tc.checkPriorityIndex.value;

    // WidgetsBinding.instance.addPostFrameCallback((_){
    //     setState(() {
    //     checkedIndex = index;
    //   });
    // });
    // onPressed(int index) {

    // }

    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            tc.checkPriorityIndex.value = index;
          });
        });

        priorityLevel = TaskPriorityModel.listOfTaskPriority[index].no;
      },
      child: Container(
        width: 64.w,
        height: 64.h,
        decoration: BoxDecoration(
            color: tc.check.value ? KColors.btn : KColors.taskboxColor,
            borderRadius: BorderRadius.circular(2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Image.asset(
                TaskPriorityModel.listOfTaskPriority[index].path,
                width: 24.w,
              ),
            ),
            TextWidget(
                padHori: 0,
                padVerti: 0,
                text: TaskPriorityModel.listOfTaskPriority[index].no.toString(),
                textStyle: KAppTypoGraphy.descriptionMedium),
          ],
        ),
      ),
    );
  }
}
