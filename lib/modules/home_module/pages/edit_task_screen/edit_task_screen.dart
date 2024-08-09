import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/Dialogs/category_dialog.dart';
import 'package:todo_app/modules/home_module/pages/edit_task_screen/components/task_edited_items.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/icon_btn.dart';
import 'package:todo_app/widgets/Buttons/negative_btn_withIcon_widget.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../components/on_focus_textFormFieldWidget.dart';
import '../../../../Dialogs/task_priority_dialog.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key, required this.indexOfSelectedTask});
  final int indexOfSelectedTask;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController taskControler;
  late TextEditingController descriptionControler;

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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.w),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBtnWidget(
                  widget:
                      Icon(Icons.close, size: 24.sp, color: KColors.txtColor),
                  btnBorder: BorderRadius.circular(4),
                  padLeft: 4.w,
                  padBottom: 4.w,
                  padRight: 4.w,
                  padTop: 4.w,
                  onTap: () {
                    HelperFunctions.popBack(context: context);
                  }),
              IconBtnWidget(
                  widget:
                      Icon(Icons.repeat, size: 24.sp, color: KColors.txtColor),
                  btnBorder: BorderRadius.circular(4),
                  padLeft: 4.w,
                  padBottom: 4.w,
                  padRight: 4.w,
                  padTop: 4.w,
                  onTap: () {}),
            ],
          ),

          // ......................................................
          taskAndDescription(index: widget.indexOfSelectedTask),

          // ......................................
          TaskEditedItemsWidget(
              iconImage: Icon(
                Icons.alarm_add_outlined,
                color: KColors.txtColor,
                size: 24.sp,
              ),
              titleOfTask: 'Task Time:',
              txtOfBtn: DecidedTaskModel
                  .listOfDecidedTask[widget.indexOfSelectedTask].dateTime,
              onPressed: () async {
                DateTime? datetime = await showOmniDateTimePicker(
                    context: context, theme: ThemeData.dark());
              }),

          TaskEditedItemsWidget(
              iconImage: Icon(
                Icons.label,
                color: KColors.txtColor,
                size: 24.sp,
              ),
              titleOfTask: 'Task Category:',
              widget: SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(KAppAssets.universityImage)),
              txtOfBtn: DecidedTaskModel
                  .listOfDecidedTask[widget.indexOfSelectedTask].category,
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
              txtOfBtn: DecidedTaskModel
                  .listOfDecidedTask[widget.indexOfSelectedTask].priority
                  .toString(),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => TaskPriorityDialog(
                          trigarBtnName: 'Edit',
                          onCanceled: () {
                            HelperFunctions.popBack(context: context);
                          },
                          onPressed: () {},
                        ));
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
                }),
          ),

          // ..............

          Spacer(),
          TrigareBtn(
              btnName: 'Edit Task',
              widthOfBtn: 327.w,
              heightOfBtn: 48.h,
              onPressed: () {})
        ]),
      ),
    );
  }

  Future<dynamic> onDeleteTaskDialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: KColors.bottomSheetColor,
              title: Text('Delete this Task ?',
                  style: TextStyle(color: Colors.white)),
              actions: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      HelperFunctions.popBack(context: context);
                    },
                    child: const Text('cancel')),
                ElevatedButton(
                    onPressed: () {
                      DecidedTaskModel.listOfDecidedTask
                          .removeAt(widget.indexOfSelectedTask);
                      HelperFunctions.popBack(context: context);
                      HelperFunctions.popBack(context: context);
                    },
                    child: const Text('Delete'))
              ],
            ));
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
              onPressed: () {}),
        ],
      ),
    ));
  }

  Padding taskAndDescription({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Column(
        children: [
          Row(
            children: [
              // 1
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: SizedBox(
                  width: 16.w,
                  height: 16.h,
                  child: Checkbox(
                      fillColor: MaterialStatePropertyAll(KColors.txtColor),
                      shape: const CircleBorder(),
                      value: false,
                      onChanged: (value) {}),
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
                        text:
                            DecidedTaskModel.listOfDecidedTask[index].taskTitle,
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
            text: DecidedTaskModel.listOfDecidedTask[index].dateTime,
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
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
