import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo_app/Dialogs/dialog.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/Dialogs/category_dialog.dart';
import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/modules/home_module/pages/edit_task_screen/components/task_edited_items.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/icon_btn.dart';
import 'package:todo_app/widgets/Buttons/negative_btn_withIcon_widget.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../components/on_focus_textFormFieldWidget.dart';
import '../../../../Dialogs/task_priority_dialog.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    super.key,
    // required this.indexOfSelectedTask,
    // required this.taskModel
  });
  // final int indexOfSelectedTask;
  // final TaskModel taskModel;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController taskControler;
  late TextEditingController descriptionControler;
  final TaskController tc = Get.find<TaskController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskControler = TextEditingController();
    descriptionControler = TextEditingController();
  }

  @override
  void dispose() {
    taskControler.dispose();
    descriptionControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime datetime = widget.taskModel.dueDate;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
          child: Obx(
            () {
              DateTime datetime = tc.dueDateTime.value;

              String time = DateFormat.jm().format(datetime);
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBtnWidget(
                        widget: Icon(Icons.close,
                            size: 24.sp, color: KColors.txtColor),
                        btnBorder: BorderRadius.circular(4),
                        padLeft: 4.w,
                        padBottom: 4.w,
                        padRight: 4.w,
                        padTop: 4.w,
                        onTap: () {
                          HelperFunctions.popBack(context: context);
                        }),
                    IconBtnWidget(
                        widget: Icon(Icons.repeat,
                            size: 24.sp, color: KColors.txtColor),
                        btnBorder: BorderRadius.circular(4),
                        padLeft: 4.w,
                        padBottom: 4.w,
                        padRight: 4.w,
                        padTop: 4.w,
                        onTap: () {}),
                  ],
                ),

                // ......................................................
                taskAndDescription(
                    task: tc.title.value, description: tc.description.value),

                // ......................................
                TaskEditedItemsWidget(
                    iconImage: Icon(
                      Icons.alarm_add_outlined,
                      color: KColors.txtColor,
                      size: 24.sp,
                    ),
                    titleOfTask: 'Task Time:',
                    txtOfBtn: time,
                    onPressed: () async {
                      DateTime? newDatetime = await showOmniDateTimePicker(
                        initialDate: datetime,
                        context: context,
                        // theme: ThemeData.dark()
                      );

                      DateTime date = DateTime(newDatetime!.year,
                          newDatetime.minute, newDatetime.day);

                      tc.dueDate.value = date;
                      tc.dueDateTime.value = newDatetime;

                      // tc.dueDate.value = datetime;
                      // tc.updateAt.value = datetime;
                    }),

                TaskEditedItemsWidget(
                    iconImage: Icon(
                      Icons.label,
                      color: KColors.txtColor,
                      size: 24.sp,
                    ),
                    titleOfTask: 'Task Category:',
                    btnColor: Color.fromARGB(
                        tc.iconColorA.value,
                        tc.iconColorR.value,
                        tc.iconColorG.value,
                        tc.iconColorB.value),
                    widget: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: SvgPicture.asset(KAppAssets.universityImage)),
                    txtOfBtn: tc.categoryName.value,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return EditCategoryDialog(context);
                          });
                    }),

                TaskEditedItemsWidget(
                    iconImage: Image.asset(KAppAssets.flagImage, width: 24.sp),
                    titleOfTask: 'Task Priority:',
                    txtOfBtn: tc.priorityLevel.value.toString(),
                    onPressed: () {
                      log(tc.priorityLevel.value.toString());
                      log('>> ID : ${tc.id.value.toString()}');
                      log('>> Category : ${tc.categoryName.toString()}');
                      log('>> description : ${tc.description.toString()}');
                      log('>> title : ${tc.title.toString()}');

                      showDialog(
                          context: context,
                          builder: (context) => TaskPriorityDialog(
                                trigarBtnName: 'Edit',
                                onCanceled: () {
                                  HelperFunctions.popBack(context: context);
                                },
                                onPressed: (va) {
                                  tc.priorityLevel.value = va;
                                  Get.back();
                                },
                              ));
                    }),

                Obx(() {
                  return TaskEditedItemsWidget(
                      iconImage: Icon(
                        Icons.star_outline_sharp,
                        color: KColors.txtColor,
                        size: 24.sp,
                      ),
                      titleOfTask: 'Task Status:',
                      txtOfBtn: tc.checkStatusForDisplay.value
                          ? fromTaskStatus(TaskStatus.completed)
                          : fromTaskStatus(TaskStatus.inprogress),
                      onPressed: () {});
                }),

                TaskEditedItemsWidget(
                    iconImage: Icon(
                      Icons.checklist_rtl,
                      color: KColors.txtColor,
                      size: 24.sp,
                    ),
                    titleOfTask: 'Sub-Task:',
                    txtOfBtn: 'Add Sub-Task',
                    onPressed: () {}),

                // ...............

                Align(
                  alignment: Alignment.topLeft,
                  child: NegativeBtnWithIconWidget(
                      btnText: 'Delete Task',
                      widget: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                        size: 24.w,
                      ),
                      onPressed: () {
                        onDeleteTaskDialoge(context);
                        tc.update();
                      }),
                ),

                // ..............

                const Spacer(),
                TrigareBtn(
                    btnName: 'Update Task',
                    widthOfBtn: 327.w,
                    heightOfBtn: 48.h,
                    onPressed: () {
                      tc.update();

                      log('>> ${tc.id.value}');
                      tc.updateTask(docId: tc.id.value);

                      HelperFunctions.showToast('Updated Success Fully');
                      Get.back();
                      // tc.checkStatus.value = false;
                      // tc.taskStatus.value = TaskStatus.inprogress;
                    })
              ]);
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> onDeleteTaskDialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              child: DialogWidget(
                  widget: TextWidget(
                    padVerti: 0,
                    padHori: 0,
                    text: '''Are You sure you want to delete this task?
Task title : Do math homework''',
                    textStyle: KAppTypoGraphy.dialogeText18Medium,
                    textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.white),
                    // textAlign: TextAlign.center,
                  ),
                  trigarBtnName: 'Delete',
                  dialogTitle: 'Delele Task',
                  onPressed: () {
                    log(tc.id.value);
                    tc.deleteTask(tc.id.value);
                    HelperFunctions.showToast(
                        '${tc.title.value} Task Deleted SuccessFully');
                    Get.back();
                    Get.back();
                  },
                  onCanceled: () {
                    Get.back();
                  },
                  heightOfDialog: 200.h),
            )
        // AlertDialog(
        //       backgroundColor: KColors.bottomSheetColor,
        //       title: Text(
        //         'Are You sure you want to delete this task? Task title : Do math homework',
        //         style: TextStyle(color: Colors.white),
        //         textAlign: TextAlign.center,
        //       ),
        //       actions: [
        //         ElevatedButton(
        //             style: const ButtonStyle(
        //                 backgroundColor:
        //                     MaterialStatePropertyAll(Colors.transparent)),
        //             onPressed: () {
        //               HelperFunctions.popBack(context: context);
        //             },
        //             child: const Text('cancel')),
        //         ElevatedButton(
        //             onPressed: () {
        //               tc.deleteTask(widget.taskModel.id);
        //               HelperFunctions.showToast(
        //                   '${widget.taskModel.title} Task Deleted SuccessFully');
        //               HelperFunctions.popBack(context: context);
        //               HelperFunctions.popBack(context: context);
        //             },
        //             child: const Text('Delete'))
        //       ],
        //     )
        );
  }

  CategoryDialog EditCategoryDialog(BuildContext context) {
    return CategoryDialog(
        optionalWidget: Padding(
      padding: EdgeInsets.symmetric(vertical: 0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TrigareBtn(
              heightOfBtn: 48.h,
              widthOfBtn: 120.w,
              flatBtn: true,
              btnName: 'cancel',
              onPressed: () {
                HelperFunctions.popBack(context: context);
              }),
          TrigareBtn(
              heightOfBtn: 48.h,
              widthOfBtn: 120.w,
              btnName: 'Edit',
              onPressed: () {
                Get.back();
              }),
        ],
      ),
    ));
  }

  Padding taskAndDescription(
      {required String task, required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              // 1
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  width: 30.w,
                  height: 20.h,
                  child: Obx(
                    () {
                      return Checkbox(
                          fillColor: MaterialStatePropertyAll(
                              KColors.inerTextFieldColor),
                          shape: const CircleBorder(),
                          // value: tc.taskStatus.value == TaskStatus.inprogress ? false: true ,
                          value: tc.checkStatusForDisplay.value,
                          onChanged: (value) {
                            tc.togalTaskStatus(value: value!);
                          });
                    },
                  ),
                ),
              ),

              // 2
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextWidget(
                        alignmentGeometry: Alignment.topLeft,
                        padVerti: 0,
                        padHori: 0,
                        text: task,
                        textStyle: KAppTypoGraphy.descriptionLarge),
                  ]),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: IconBtnWidget(
                    widget: Icon(Icons.edit_note_outlined,
                        size: 24.sp, color: KColors.txtColor),
                    btnBorder: BorderRadius.circular(4),
                    btnColor: Colors.transparent,
                    padLeft: 4.w,
                    padBottom: 4.w,
                    padRight: 4.w,
                    padTop: 4.w,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => EditTitleDescriptionDialog());
                    }),
              ),
            ],
          ),
          // ....................
          TextWidget(
            alignmentGeometry: Alignment.topLeft,
            padHori: 60.w,
            padVerti: 0,
            text: description,
            textStyle: KAppTypoGraphy.description2Medium,
          ),
        ],
      ),
    );
  }

  Dialog EditTitleDescriptionDialog() => Dialog(
        child: Container(
          height: 225.h,
          width: 427.w,
          decoration: BoxDecoration(
              color: KColors.bottomSheetColor,
              borderRadius: BorderRadius.circular(10.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(
                    padHori: 0,
                    alignmentGeometry: Alignment.center,
                    padVerti: 5.w,
                    text: 'Edit Your Task',
                    textStyle: KAppTypoGraphy.categoryTextStyle15M),

                Divider(),

                OnFocusTextFormFieldWidget(
                  hintText: 'Write a Task',
                  autoFocus: true,
                  controller: taskControler,

                  // taskOnTap: () {},
                ),
                OnFocusTextFormFieldWidget(
                  hintTextStyle: KAppTypoGraphy.description2Medium,
                  hintText: 'description',
                  controller: descriptionControler,
                  // taskOnTap: () {},
                ),

                // .....
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TrigareBtn(
                          heightOfBtn: 48.h,
                          widthOfBtn: 120.w,
                          flatBtn: true,
                          btnName: 'cancel',
                          onPressed: () {
                            HelperFunctions.popBack(context: context);
                          }),
                      TrigareBtn(
                          heightOfBtn: 48.h,
                          widthOfBtn: 120.w,
                          btnName: 'Edit',
                          onPressed: () {
                            tc.title.value = taskControler.text;
                            tc.description.value = descriptionControler.text;
                            Get.back();
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
