import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:todo_app/Dialogs/task_priority_dialog.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/modules/home_module/components/home_appbar.dart';
import 'package:todo_app/modules/home_module/components/on_screen/on_screen.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../Dialogs/category_dialog.dart';
import '../../widgets/Buttons/icon_btn.dart';
import '../../widgets/Buttons/trigar_btn.dart';
import 'components/home_bottom_navbar.dart';
import 'components/on_focus_textFormFieldWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController taskCtrl;
  late TextEditingController descriptionCtrl;
  late TextEditingController searchbarCtrl;
  final _formKey = GlobalKey<FormState>();
  bool onTaskFocus = false;
  bool onDescriptionFocus = false;
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  final TaskController tc = Get.find<TaskController>();

  @override
  void initState() {
    super.initState();
    Get.put(CategoryAddControler(), permanent: true);
    taskCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
    searchbarCtrl = TextEditingController();
    onTaskFocus = true;

    // focusNode.requestFocus();
    // focusNode.addListener(() {
    // setState(() {});
    // });
  }

  @override
  void dispose() {
    focusNode.dispose();
    taskCtrl.dispose();
    descriptionCtrl.dispose();
    searchbarCtrl.dispose();

    super.dispose();
  }

  _getDateTime() async {
    try {
      DateTime? datetime = await showOmniDateTimePicker(
          context: context, theme: ThemeData.dark());

      if (datetime != null) {
        tc.dateTime.value = datetime;
      } else {
        Fluttertoast.showToast(msg: 'DateTime is not Selected');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error while DateTime');
    }
  }

  _selectCategory() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const HomeAppBarWidget(),
            OnScreen(controller: searchbarCtrl)
          ]),
        ),
      ),
      bottomNavigationBar:
          HomeBottomNavbarWidget(onPressed: showBottomSheet, index: 0),
    );
  }

  showBottomSheet() {
    double padingbBtwIcons = 30.w;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 230.h,
              decoration: BoxDecoration(
                  color: KColors.bottomSheetColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                // FORM TEXT FIELDS....................................
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextWidget(
                          padHori: 0,
                          alignmentGeometry: Alignment.topLeft,
                          padVerti: 5.w,
                          text: 'Add Task',
                          textStyle: KAppTypoGraphy.displayTitleMedium),
                      OnFocusTextFormFieldWidget(
                        hintText: 'Write a Task',
                        autoFocus: true,
                        controller: taskCtrl,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Titile';
                          } else {
                            return null;
                          }
                        },
                        // taskOnTap: () {},
                      ),
                      OnFocusTextFormFieldWidget(
                        hintText: 'description',
                        controller: descriptionCtrl,
                        // taskOnTap: () {},
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Description';
                          } else {
                            return null;
                          }
                        },
                      ),
                      // \......................................>>ROW.....................
                      Row(
                        children: [
                          IconBtnWidget(
                            padRight: padingbBtwIcons,
                            widget: Icon(
                              Icons.alarm_add_outlined,
                              color: KColors.txtColor,
                              size: 24.sp,
                            ),
                            onTap: _getDateTime,
                          ),
                          // ................................
                          IconBtnWidget(
                            padRight: padingbBtwIcons,
                            widget: SvgPicture.asset(KAppAssets.categoryImage),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => CategoryDialog(
                                  optionalWidget: TrigareBtn(
                                      heightOfBtn: 48.h,
                                      widthOfBtn: 289.w,
                                      btnName: 'Add Category',
                                      onPressed: _selectCategory),
                                ),
                              );
                            },
                          ),
                          // .........................................
                          IconBtnWidget(
                            padRight: padingbBtwIcons,
                            widget: SvgPicture.asset(KAppAssets.flgImage),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => TaskPriorityDialog(
                                        trigarBtnName: 'Save',
                                        onCanceled: () {
                                          Get.back();
                                        },
                                        onPressed: (level) {
                                          tc.priorityLevel.value = level;
                                          Fluttertoast.showToast(
                                              msg: 'Selected: $level');
                                          HelperFunctions.popBack(
                                              context: context);
                                        },
                                      ));
                            },
                          ),
                          const Expanded(child: SizedBox()),
                          IconBtnWidget(
                            padRight: 0,
                            widget: SvgPicture.asset(KAppAssets.sendImage),
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else {
                                _formKey.currentState!.validate();

                                try {
                                  HomeTaskModel model = HomeTaskModel(
                                      title: taskCtrl.text,
                                      description: descriptionCtrl.text,
                                      dueDate: tc.dateTime.value,
                                      createdAt: DateTime.now(),
                                      updateAt: DateTime.now(),
                                      iconCodePoint: tc.iconCodePoint.value,
                                      iconFontFamily: tc.iconFontFamilty.value,
                                      iconColorA: tc.iconColorA.value,
                                      iconColorB: tc.iconColorB.value,
                                      iconColorG: tc.iconColorG.value,
                                      iconColorR: tc.iconColorR.value,
                                      priorityLevel: tc.priorityLevel.value);

                                  tc.addNewTask(model);
                                  // tc.checkCategoryIndex.refresh();
                                  // tc.checkPriorityIndex.refresh();
                                  // tc.priorityLevel.refresh();
                                  taskCtrl.clear();
                                  descriptionCtrl.clear();
                                  tc.check.refresh();

                                  HelperFunctions.showToast(
                                      'Task is Added SuccessFully!');
                                } catch (e) {
                                  HelperFunctions.showToast(
                                      'ERROR occue while Add Task!');
                                  log(e.toString());
                                }
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
