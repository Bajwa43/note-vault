// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';

// import 'package:todo_app/Dialogs/task_priority_dialog.dart';
// import 'package:todo_app/data/app_assets.dart';
// import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
// import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
// import 'package:todo_app/modules/home_module/components/home_appbar.dart';
// import 'package:todo_app/modules/home_module/components/on_screen/on_screen.dart';
// import 'package:todo_app/modules/home_module/controller/task_controller.dart';
// import 'package:todo_app/utiles/Constants/colors.dart';
// import 'package:todo_app/utiles/Constants/size.dart';
// import 'package:todo_app/utiles/helpers/helper_functions.dart';
// import 'package:todo_app/widgets/txtWidget.dart';

// import '../../Dialogs/category_dialog.dart';
// import '../../widgets/Buttons/icon_btn.dart';
// import '../../widgets/Buttons/trigar_btn.dart';
// import 'components/home_bottom_navbar.dart';
// import 'components/on_focus_textFormFieldWidget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late TextEditingController taskCtrl;
//   late TextEditingController descriptionCtrl;
//   late TextEditingController searchbarCtrl;
//   final _formKey = GlobalKey<FormState>();
//   bool onTaskFocus = false;
//   bool onDescriptionFocus = false;
//   FocusNode focusNode = FocusNode();
//   FocusNode focusNode1 = FocusNode();
//   final TaskController tc = Get.find<TaskController>();

//   Color? _dateBtnColor;

//   Color? _categoryBtnColor;

//   Color? _priorityBtnColor;

//   @override
//   void initState() {
//     super.initState();
//     Get.put(CategoryAddControler(), permanent: true);
//     taskCtrl = TextEditingController();
//     descriptionCtrl = TextEditingController();
//     searchbarCtrl = TextEditingController();
//     onTaskFocus = true;

//     // focusNode.requestFocus();
//     // focusNode.addListener(() {
//     // setState(() {});
//     // });
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();
//     taskCtrl.dispose();
//     descriptionCtrl.dispose();
//     searchbarCtrl.dispose();

//     super.dispose();
//   }

//   _getDateTime() async {
//     try {
//       DateTime? datetime = await showOmniDateTimePicker(
//           context: context, theme: ThemeData.dark());

//       if (datetime != null) {
//         _dateBtnColor = KColors.btn;
//         tc.dueDate.value = datetime;
//       } else {
//         Fluttertoast.showToast(msg: 'DateTime is not Selected');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Error while DateTime');
//     }
//   }

//   _selectCategory() {
//     _categoryBtnColor = Color.fromARGB(tc.iconColorA.value, tc.iconColorR.value,
//         tc.iconColorG.value, tc.iconColorB.value);
//     Get.back();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: KColors.backGround,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(children: [
//             const HomeAppBarWidget(),
//             OnScreen(controller: searchbarCtrl)
//           ]),
//         ),
//       ),
//       bottomNavigationBar:
//           HomeBottomNavbarWidget(onPressed: showBottomSheet, index: 0),
//     );
//   }

//   showBottomSheet() {
//     double padingbBtwIcons = 30.w;
//     showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (context) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Container(
//               height: 230.h,
//               decoration: BoxDecoration(
//                   color: KColors.bottomSheetColor,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10.w),
//                       topRight: Radius.circular(10.w))),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 15.w,
//                 ),
//                 // FORM TEXT FIELDS....................................
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       TextWidget(
//                           padHori: 0,
//                           alignmentGeometry: Alignment.topLeft,
//                           padVerti: 5.w,
//                           text: 'Add Task',
//                           textStyle: KAppTypoGraphy.displayTitleMedium),
//                       OnFocusTextFormFieldWidget(
//                         hintText: 'Write a Task',
//                         autoFocus: true,
//                         controller: taskCtrl,
//                         validation: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Titile';
//                           } else {
//                             return null;
//                           }
//                         },
//                         // taskOnTap: () {},
//                       ),
//                       OnFocusTextFormFieldWidget(
//                         hintText: 'description',
//                         controller: descriptionCtrl,
//                         // taskOnTap: () {},
//                         validation: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Description';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       // \......................................>>ROW.....................
//                       Row(
//                         children: [
//                           IconBtnWidget(
//                             btnColor: _dateBtnColor ?? null,
//                             padRight: padingbBtwIcons,
//                             widget: Icon(
//                               Icons.alarm_add_outlined,
//                               color: KColors.txtColor,
//                               size: 24.sp,
//                             ),
//                             onTap: _getDateTime,
//                             // btnBorder: BorderRadius.circular(10),
//                           ),
//                           // ................................
//                           IconBtnWidget(
//                             btnColor: _categoryBtnColor,
//                             padRight: padingbBtwIcons,
//                             widget: SvgPicture.asset(KAppAssets.categoryImage),
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => CategoryDialog(
//                                   optionalWidget: TrigareBtn(
//                                       heightOfBtn: 48.h,
//                                       widthOfBtn: 289.w,
//                                       btnName: 'Add Category',
//                                       onPressed: _selectCategory),
//                                 ),
//                               );
//                             },
//                           ),
//                           // .........................................
//                           IconBtnWidget(
//                             btnColor: _priorityBtnColor,
//                             padRight: padingbBtwIcons,
//                             widget: SvgPicture.asset(KAppAssets.flgImage),
//                             onTap: () {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) => TaskPriorityDialog(
//                                         trigarBtnName: 'Save',
//                                         onCanceled: () {
//                                           Get.back();
//                                         },
//                                         onPressed: (level) {
//                                           tc.priorityLevel.value = level;
//                                           Fluttertoast.showToast(
//                                               msg: 'Selected: $level');
//                                           HelperFunctions.popBack(
//                                               context: context);
//                                           _priorityBtnColor = KColors.btn;
//                                         },
//                                       ));
//                             },
//                           ),
//                           const Expanded(child: SizedBox()),
//                           IconBtnWidget(
//                             padRight: 0,
//                             widget: SvgPicture.asset(KAppAssets.sendImage),
//                             onTap: () {
//                               if (!_formKey.currentState!.validate()) {
//                                 return;
//                               } else {
//                                 _formKey.currentState!.validate();

//                                 try {
//                                   TaskModel model = TaskModel(
//                                       id: '',
//                                       title: taskCtrl.text,
//                                       description: descriptionCtrl.text,
//                                       dueDate: tc.dueDate.value,
//                                       createdAt: DateTime.now(),
//                                       updateAt: DateTime.now(),
//                                       iconCodePoint: tc.iconCodePoint.value,
//                                       iconFontFamily: tc.iconFontFamily.value,
//                                       iconColorA: tc.iconColorA.value,
//                                       iconColorB: tc.iconColorB.value,
//                                       iconColorG: tc.iconColorG.value,
//                                       iconColorR: tc.iconColorR.value,
//                                       priorityLevel: tc.priorityLevel.value,
//                                       status: TaskStatus.inprogress,
//                                       categoryName: tc.categoryName.value);

//                                   tc.addNewTask(model);
//                                   // tc.checkCategoryIndex.refresh();
//                                   // tc.checkPriorityIndex.refresh();
//                                   // tc.priorityLevel.refresh();
//                                   taskCtrl.clear();
//                                   descriptionCtrl.clear();
//                                   _categoryBtnColor = null;
//                                   _dateBtnColor = null;
//                                   _priorityBtnColor = null;
//                                   HelperFunctions.showToast(
//                                       'Task is Added SuccessFully!');
//                                 } catch (e) {
//                                   HelperFunctions.showToast(
//                                       'ERROR occue while Add Task!');
//                                   log(e.toString());
//                                 }
//                               }
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:todo_app/Dialogs/task_priority_dialog.dart';
import 'package:todo_app/controllers/profile_controller.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/modules/Calendar_module/calendar_screen.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/modules/focus_module/focus_screen.dart';
import 'package:todo_app/modules/home_module/components/home_appbar.dart';
import 'package:todo_app/modules/home_module/components/on_screen/on_screen.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/modules/profile_mudule/profile_screen.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../Dialogs/category_dialog.dart';
import '../../widgets/Buttons/icon_btn.dart';
import '../../widgets/Buttons/trigar_btn.dart';
import 'components/home_bottom_navbar.dart';
import 'components/on_focus_textFormFieldWidget.dart';
import 'screen.dart';

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

  final TaskController _tc = Get.find<TaskController>();
  final ProfileController _pc = Get.find<ProfileController>();

  Color? _dateBtnColor;

  Color? _categoryBtnColor;

  Color? _priorityBtnColor;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(CategoryAddControler(), permanent: true);
    taskCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
    searchbarCtrl = TextEditingController();
    onTaskFocus = true;
    _pc.getUserDate();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SafeArea(child: listOfPage[pageIndex]),
      bottomNavigationBar: HomeBottomNavbarWidget(
          onPressed: (index) {
            pageIndex = index;
            setState(() {});
          },
          onAddPressed: () {
            showBottomSheet();
          },
          index: 0),
    );
  }

  _getDateTime() async {
    try {
      DateTime? datetime = await showOmniDateTimePicker(
          // barrierColor: Colors.amber,
          // firstDate: DateTime(2024, 07, 10, 5, 30, 0, 0, 0),
          initialDate: _tc.dueDateTime.value,
          // barrierDismissible: true,
          // type: OmniDateTimePickerType.time,
          context: context,
          // theme: ThemeData.dark(),
          theme: ThemeData.light());

      // var time = tc.dueDateTime.value;
      // DateFormat df = DateFormat.jm();
      // var dueTime = df.format(time);

      if (datetime != null) {
        DateTime date = DateTime(datetime.year, datetime.month, datetime.day);
        _tc.dueDate.value = date;
        _dateBtnColor = KColors.btn;
        _tc.dueDateTime.value = datetime;
      } else {
        Fluttertoast.showToast(msg: 'DateTime is not Selected');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error while DateTime');
    }
  }

  _selectCategory() {
    _categoryBtnColor = Color.fromARGB(_tc.iconColorA.value,
        _tc.iconColorR.value, _tc.iconColorG.value, _tc.iconColorB.value);
    Get.back();
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
                            btnColor: _dateBtnColor ?? null,
                            padRight: padingbBtwIcons,
                            widget: Icon(
                              Icons.alarm_add_outlined,
                              color: KColors.txtColor,
                              size: 24.sp,
                            ),
                            onTap: _getDateTime,
                            // btnBorder: BorderRadius.circular(10),
                          ),
                          // ................................
                          IconBtnWidget(
                            btnColor: _categoryBtnColor,
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
                            btnColor: _priorityBtnColor,
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
                                          _tc.priorityLevel.value = level;
                                          Fluttertoast.showToast(
                                              msg: 'Selected: $level');
                                          HelperFunctions.popBack(
                                              context: context);
                                          _priorityBtnColor = KColors.btn;
                                        },
                                      ));
                            },
                          ),

                          // SAVE TASK BTN
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
                                  // var dueTime = DateTime(
                                  //     tc.dueDateTime.value.hour,
                                  //     tc.dueDateTime.value.minute);
                                  // DateTime dueDate= DateTime(
                                  //     tc.dueDate.value.year,
                                  //     tc.dueDate.value.month,
                                  //     tc.dueDate.value.day);
                                  // DateFormat.jm().format(tc.dueDate.value);

                                  // log(dueTime.toString());

                                  TaskModel model = TaskModel(
                                      id: '',
                                      title: taskCtrl.text,
                                      description: descriptionCtrl.text,
                                      dueDate: _tc.dueDate.value,
                                      dueDateTime: _tc.dueDateTime.value,
                                      createdAt: DateTime.now(),
                                      updateAt: DateTime.now(),
                                      iconCodePoint: _tc.iconCodePoint.value,
                                      iconFontFamily: _tc.iconFontFamily.value,
                                      iconColorA: _tc.iconColorA.value,
                                      iconColorB: _tc.iconColorB.value,
                                      iconColorG: _tc.iconColorG.value,
                                      iconColorR: _tc.iconColorR.value,
                                      priorityLevel: _tc.priorityLevel.value,
                                      status: TaskStatus.inprogress,
                                      categoryName: _tc.categoryName.value);

                                  _tc.addNewTask(model);
                                  // tc.checkCategoryIndex.refresh();
                                  // tc.checkPriorityIndex.refresh();
                                  // tc.priorityLevel.refresh();
                                  taskCtrl.clear();
                                  descriptionCtrl.clear();

                                  _categoryBtnColor = null;
                                  _dateBtnColor = null;
                                  _priorityBtnColor = null;
                                  // Controler DataMember is Reset
                                  _tc.dueDate.value = DateTime.now();
                                  _tc.dueDateTime.value = DateTime.now();

                                  // Get.back();
                                  HelperFunctions.showToast(
                                      'Task is Added SuccessFully!');
                                } catch (e) {
                                  HelperFunctions.showToast(
                                      'ERROR occue while Add Task!');
                                  // log(e.toString());
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

List listOfPage = [Screen(), CalendarScreen(), FocusScreen(), ProfileScreen()];
