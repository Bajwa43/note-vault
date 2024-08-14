// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/models/completed_task.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/components/no_screen.dart';
import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/combine_button.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';

import 'package:todo_app/widgets/txtFieldWidget.dart';

class OnScreen extends StatelessWidget {
  final TextEditingController controller;
  // final TaskController tc = Get.find<TaskController>();

  OnScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GetBuilder(
        init: TaskController(),
        builder: (cont) {
          if (cont.listOfTask.isEmpty) {
            return const NoScreenWidget();
          }
          return Column(
            children: [
              TextFieldWidget(
                padhori: 0,
                hintText: 'Search',
                controller: controller,
                showPrefixIcon: true,
                prefixIconifTrue: Icon(Icons.search),
              ),

              Column(
                children: [
                  // ......> ToDay
                  Align(
                    alignment: Alignment.topLeft,
                    child: CombineButtonWidget(
                      btnText: 'ToDay',
                      onTap: () {},
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cont.listOfTask.length,
                    // itemCount: 1,
                    itemBuilder: (context, index) {
                      TaskModel taskModel = cont.listOfTask[index];
                      return TaskCardWidget(
                        btnColor: Colors.blue,
                        taskModel: taskModel,
                      );
                    },
                  ),

                  // ............>Completed
                  Align(
                    alignment: Alignment.topLeft,
                    child: CombineButtonWidget(
                      widthOfBtn: 102.w,
                      btnText: 'Completed',
                      onTap: () {},
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cont.listOfTask.length,
                    // itemCount: 2,
                    itemBuilder: (context, index) {
                      TaskModel taskModel = cont.listOfTask[index];
                      return TaskCardWidget(
                        btnHide: true,
                        taskModel: taskModel,
                      );
                    },
                  ),
                ],
              ),

              // TaskCardWidget(
              //   btnColor: Colors.red.shade300,
              //   index: 1,
              //   list: DecidedTaskModel.listOfDecidedTask,
              // ),
              // TaskCardWidget(
              //   btnColor: Colors.amber.shade400,
              //   index: 0,
              //   list: DecidedTaskModel.listOfDecidedTask,
              // ),
              // Expanded(
              //   child: Container(
              //     color: Colors.amber,
              //   ),
              //   // child: ListView.builder(
              //   //   itemCount: 3,
              //   //   itemBuilder: (context, index) {
              //   //     return TaskCardWidget();
              //   //   },
              //   // ),
              // )
            ],
          );
        },
      ),
    );
  }
}
