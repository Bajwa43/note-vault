// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/completed_task.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/combine_button.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';

import 'package:todo_app/widgets/txtFieldWidget.dart';

class OnScreen extends StatelessWidget {
  final TextEditingController controller;

  const OnScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
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
                // itemCount: DecidedTaskModel.listOfDecidedTask.length,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TaskCardWidget(
                    btnColor: Colors.blue,
                    index: index,
                    list: DecidedTaskModel.listOfDecidedTask,
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
                itemCount: CompletedTaskModel.listOFCompletedTask.length,
                // itemCount: 2,
                itemBuilder: (context, index) {
                  return TaskCardWidget(
                    btnHide: true,
                    // btnColor: Colors.blue,
                    index: index,
                    list: CompletedTaskModel.listOFCompletedTask,
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
      ),
    );
  }
}
