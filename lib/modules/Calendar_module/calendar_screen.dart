import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/components/home_bottom_navbar.dart';
import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'controller/calendar_controller.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  late List<DecidedTaskModel> listOfDecidedTasks;

  var _focusDate = DateTime.now();

  // bool _btnHide = false;

  late TextEditingController taskControler;

  late TextEditingController descriptionControler;
  final TaskController _tc = Get.find<TaskController>();
  final CalendarController _calendarController = Get.find<CalendarController>();

  @override
  void initState() {
    super.initState();
    listOfDecidedTasks = DecidedTaskModel.listOfDecidedTask;
    taskControler = TextEditingController();
    descriptionControler = TextEditingController();
    _calendarController.getAllTasksOnThatRange(
        _tc.dueDateTime.value, TaskStatus.inprogress);
  }

  @override
  void dispose() {
    taskControler.dispose();
    descriptionControler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              TextWidget(
                  padVerti: 10,
                  text: 'Calendar',
                  textStyle: KAppTypoGraphy.displayTitleMedium),
              // HorizontalCalendar(
              //   date: DateTime.now(),
              //   textColor: KColors.txtColor,
              //   backgroundColor: KColors.bottomSheetColor,
              //   selectedColor: Colors.blue,
              //   showMonth: true,
              //   // lastDate: DateTime(2024),
              //   onDateSelected: (date) {
              //     print(date.toString());
              //   },
              // ),

// ...................................SCROLLER DATETIMER
              Container(
                color: KColors.bottomSheetColor,
                child: EasyInfiniteDateTimeLine(
                  activeColor: KColors.btn,
                  headerBuilder: (context, date) => Container(
                    // color: Colors.amber,
                    height: 40,
                    child: Column(children: [
                      Text(DateFormat("MMMM").format(_focusDate),
                          style: KAppTypoGraphy.Month14N),
                      Text(
                        DateFormat("yyyy").format(_focusDate),
                        style: KAppTypoGraphy.year10N,
                      ),
                    ]),
                  ),
                  controller: _controller,
                  firstDate: DateTime(2022),
                  focusDate: _calendarController.focusDate.value,
                  lastDate: DateTime(2025),
                  onDateChange: (selectedDate) {
                    _focusDate = selectedDate;
                    _calendarController.focusDate.value = selectedDate;
                    // _calendarController.todayBtnOffFocus ?

                    _calendarController.getAllTasksOnThatRange(
                        selectedDate, _tc.taskStatus.value);
                    // });
                  },
                ),
              ),

              // ..............................

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
                child: Column(
                  children: [
                    // ...
                    Container(
                        // width: 326.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: KColors.bottomSheetColor,
                            borderRadius: BorderRadius.circular(6.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TrigareBtn(
                              heightOfBtn: 49.h,
                              widthOfBtn: 137.w,
                              btnName: 'Today',
                              flatBorderColor: KColors.hintTxtColor,
                              flatBtn:
                                  _calendarController.todayBtnOffFocus.value,
                              onPressed: () {
                                _tc.taskStatus.value = TaskStatus.inprogress;
                                log("This is the selected date ${_focusDate}");
                                _calendarController.completedBtnOffFocus.value =
                                    true;
                                _calendarController.todayBtnOffFocus.value =
                                    false;
                                // _btnHide = false;
                                _calendarController.filterdList.value = [];
                                _calendarController.getAllTasksOnThatRange(
                                    _focusDate, TaskStatus.inprogress);
                              },
                            ),
                            TrigareBtn(
                              flatBorderColor: KColors.hintTxtColor,
                              heightOfBtn: 49.h,
                              widthOfBtn: 137.w,
                              flatBtn: _calendarController
                                  .completedBtnOffFocus.value,
                              btnName: 'Completed',
                              onPressed: () {
                                _calendarController.completedBtnOffFocus.value =
                                    false;
                                _calendarController.todayBtnOffFocus.value =
                                    true;
                                _tc.taskStatus.value = TaskStatus.completed;
                                _calendarController.filterdList.value = [];
                                _calendarController.getAllTasksOnThatRange(
                                    _focusDate, TaskStatus.completed);
                              },
                            ),
                          ],
                        )),

                    SizedBox(
                      // width: 300,
                      height: 339.5,
                      child: Obx(() {
                        // _calendarController.filterdList.value;

                        return _calendarController.getFilterdList.isEmpty
                            ? TextWidget(
                                text: 'Not Active Any Task At this Time',
                                textStyle: KAppTypoGraphy.dialogeText18Medium)
                            : ListView.builder(
                                // physics:
                                //     const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    _calendarController.getFilterdList.length,
                                // itemCount: 1,
                                itemBuilder: (context, index) {
                                  TaskModel taskModel =
                                      _calendarController.getFilterdList[index];
                                  return TaskCardWidget(
                                    btnHide: _calendarController
                                        .todayBtnOffFocus.value,
                                    taskModel: taskModel,
                                  );
                                },
                              );
                      }),

                      // child: FutureBuilder(
                      //   future: _calendarController.todayBtnOffFocus.value
                      //       ? _calendarController.getAllTasksOnThatRange(
                      //           _calendarController.focusDate.value,
                      //           TaskStatus.completed)
                      //       : _calendarController.getAllTasksOnThatRange(
                      //           _calendarController.focusDate.value,
                      //           TaskStatus.inprogress),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData == false) {
                      //       return Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             const CircularProgressIndicator.adaptive(),
                      //             TextWidget(
                      //                 text: 'Loading...',
                      //                 textStyle:
                      //                     KAppTypoGraphy.dialogeText18Medium)
                      //           ]);
                      //     }
                      //     return snapshot.data!.isEmpty
                      //         ? TextWidget(
                      //             text: 'Not Active Any Task At this Time',
                      //             textStyle:
                      //                 KAppTypoGraphy.dialogeText18Medium)
                      //         : ListView.builder(
                      //             // physics:
                      //             //     const NeverScrollableScrollPhysics(),
                      //             shrinkWrap: true,
                      //             itemCount: snapshot.data!.length,
                      //             // itemCount: 1,
                      //             itemBuilder: (context, index) {
                      //               TaskModel taskModel =
                      //                   snapshot.data![index];
                      //               return TaskCardWidget(
                      //                 btnHide: _calendarController
                      //                     .todayBtnOffFocus.value,
                      //                 taskModel: taskModel,
                      //               );
                      //             },
                      //           );
                      //   },
                      // ),
                      // child: ListView.builder(
                      //   // itemCount: 0,
                      //   itemCount: _calendarController.todayBtnOffFocus.value
                      //       ? _calendarController.listOfCompletedTask.length
                      //       : _calendarController.listOfInProgressTask.length,
                      //   itemBuilder: (context, index) {
                      //     // log('INDEX: ${index.toString()}');
                      //     // log(_tc.listOfCompletedTask.length.toString());
                      //     // log(_tc.listOfInProgressTask.length.toString());

                      //     // DateTime comingDate =
                      //     //     _tc.listOfInProgressTask[index].dueDate;
                      //     // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                      //     // String actualDate = dateFormat.format(comingDate);
                      //     // String focusDate = dateFormat
                      //     //     .format(_calendarController.focusDate.value);

                      //     // if (focusDate == actualDate) {}

                      //     return TaskCardWidget(
                      //       btnHide:
                      //           _calendarController.todayBtnOffFocus.value,
                      //       taskModel:
                      //           _calendarController.todayBtnOffFocus.value
                      //               ? _calendarController
                      //                   .listOfCompletedTask[index]
                      //               : _calendarController
                      //                   .listOfInProgressTask[index],
                      //     );
                      //   },
                      // ),
                    ),

                    // TaskCardWidget(
                    //     btnHide: _btnHide,
                    //     taskModel: tc.listOfInProgressTask[0]),

                    // ListView.builder(
                    //   itemCount: listOfDecidedTasks.length,
                    //   itemBuilder: (context, index) => TaskCardWidget(index: index),
                    // )
                  ],
                ),
              )
            ],
          );
        }),
      ),
      // bottomNavigationBar: HomeBottomNavbarWidget(
      //     onPressed: showBottomSheetAddBtn(
      //         context: context,
      //         taskControler: taskControler,
      //         descriptionControler: descriptionControler),
      //     index: 1));
      // bottomNavigationBar: HomeBottomNavbarWidget(
      //     onPressed: () {
      //       // setState(() {
      //       //   print('sdfghj');
      //       // });
      //     },
      //     index: 2)
    );
  }
}









// ...............................................

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
// import 'package:todo_app/models/decided_teask_model.dart';
// import 'package:todo_app/modules/home_module/components/home_bottom_navbar.dart';
// import 'package:todo_app/modules/home_module/components/no_screen.dart';
// import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
// import 'package:todo_app/modules/home_module/controller/task_controller.dart';
// import 'package:todo_app/utiles/Constants/colors.dart';
// import 'package:todo_app/utiles/Constants/size.dart';
// import 'package:todo_app/widgets/Buttons/combine_button.dart';
// import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
// import 'package:todo_app/widgets/txtFieldWidget.dart';
// import 'package:todo_app/widgets/txtWidget.dart';
// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'controller/calendar_controller.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({super.key});

//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   final EasyInfiniteDateTimelineController _controller =
//       EasyInfiniteDateTimelineController();
//   late List<DecidedTaskModel> listOfDecidedTasks;

//   var _focusDate = DateTime.now();
//   // bool _btnHide = false;

//   late TextEditingController taskControler;

//   late TextEditingController descriptionControler;
//   final TaskController _tc = Get.find<TaskController>();
//   final CalendarController _calendarController = Get.find<CalendarController>();

//   @override
//   void initState() {
//     super.initState();
//     listOfDecidedTasks = DecidedTaskModel.listOfDecidedTask;
//     taskControler = TextEditingController();
//     descriptionControler = TextEditingController();
//   }

//   @override
//   void dispose() {
//     taskControler.dispose();
//     descriptionControler.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }

//   bool showCompletedWidget = false;
//   DateTime? selectedDatet;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextWidget(
//                     padVerti: 10,
//                     text: 'Calendar',
//                     textStyle: KAppTypoGraphy.displayTitleMedium),

//                 Container(
//                   color: KColors.bottomSheetColor,
//                   child: EasyInfiniteDateTimeLine(
//                     activeColor: KColors.btn,
//                     headerBuilder: (context, date) => Container(
//                       // color: Colors.amber,
//                       height: 40,
//                       child: Column(children: [
//                         Text(DateFormat("MMMM").format(_focusDate),
//                             style: KAppTypoGraphy.Month14N),
//                         Text(
//                           DateFormat("yyyy").format(_focusDate),
//                           style: KAppTypoGraphy.year10N,
//                         ),
//                       ]),
//                     ),
//                     controller: _controller,
//                     firstDate: DateTime(2022),
//                     focusDate: _focusDate,
//                     lastDate: DateTime(2025),
//                     onDateChange: (selectedDate) {
//                       setState(() {
//                         _focusDate = selectedDate;
//                         DateFormat dateFormat = DateFormat("yyyy-MM-dd");
//                         selectedDatet = selectedDate;
//                         String all = dateFormat.format(_focusDate);
//                         // log(_focusDate.toString());
//                         log(all);
//                       });
//                     },
//                   ),
//                 ),

//                 // ..............................

//                 Padding(
//                   padding: EdgeInsets.only(top: 20, left: 24, right: 24),
//                   child: Column(
//                     children: [
//                       Container(
//                         // width: 326.w,
//                         height: 80.h,
//                         decoration: BoxDecoration(
//                             color: KColors.bottomSheetColor,
//                             borderRadius: BorderRadius.circular(6.w)),
//                         child: Obx(
//                           () => Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               TrigareBtn(
//                                 heightOfBtn: 49.h,
//                                 widthOfBtn: 137.w,
//                                 btnName: 'Today',
//                                 flatBorderColor: KColors.hintTxtColor,
//                                 flatBtn:
//                                     _calendarController.todayBtnOffFocus.value,
//                                 onPressed: () {
//                                   setState(() {
//                                     showCompletedWidget = false;
//                                     selectedDatet = null;
//                                   });
//                                 },
//                               ),
//                               TrigareBtn(
//                                 flatBorderColor: KColors.hintTxtColor,
//                                 heightOfBtn: 49.h,
//                                 widthOfBtn: 137.w,
//                                 flatBtn: _calendarController
//                                     .completedBtnOffFocus.value,
//                                 btnName: 'Completed',
//                                 onPressed: () {
//                                   showCompletedWidget = true;
//                                   selectedDatet = null;
//                                   setState(() {});
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       DateWiseTasksWidget(
//                         showCompletedTaks: showCompletedWidget,
//                         filtredDate: selectedDatet,
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         // bottomNavigationBar: HomeBottomNavbarWidget(
//         //     onPressed: showBottomSheetAddBtn(
//         //         context: context,
//         //         taskControler: taskControler,
//         //         descriptionControler: descriptionControler),
//         //     index: 1));
//         bottomNavigationBar: HomeBottomNavbarWidget(
//             onPressed: () {
//               // setState(() {
//               //   print('sdfghj');
//               // });
//             },
//             index: 1));
//   }
// }

// class DateWiseTasksWidget extends StatelessWidget {
//   const DateWiseTasksWidget(
//       {super.key, this.showCompletedTaks = false, this.filtredDate});
//   final bool showCompletedTaks;
//   final DateTime? filtredDate;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: filtredDate == null
//             ? GetBuilder(
//                 init: TaskController(),
//                 builder: (cont) {
//                   if (cont.listOfInProgressTask.isEmpty &&
//                       cont.listOfCompletedTask.isEmpty) {
//                     return const NoScreenWidget();
//                   }
//                   return Column(
//                     children: [
//                       Column(
//                         children: [
//                           // ......> ToDay

//                           if (showCompletedTaks) ...[
//                             cont.listOfCompletedTask.isEmpty
//                                 ? TextWidget(
//                                     text: 'No Completed Task History',
//                                     textStyle:
//                                         KAppTypoGraphy.dialogeText18Medium)
//                                 : ListView.builder(
//                                     physics: NeverScrollableScrollPhysics(),
//                                     shrinkWrap: true,
//                                     itemCount: cont.listOfCompletedTask.length,
//                                     // itemCount: 2,
//                                     itemBuilder: (context, index) {
//                                       TaskModel taskModel =
//                                           cont.listOfCompletedTask[index];
//                                       return TaskCardWidget(
//                                         btnHide: true,
//                                         taskModel: taskModel,
//                                       );
//                                     },
//                                   ),
//                           ] else ...[
//                             cont.listOfInProgressTask.isEmpty
//                                 ? TextWidget(
//                                     text: 'Not Active Any Task At this Time',
//                                     textStyle:
//                                         KAppTypoGraphy.dialogeText18Medium)
//                                 : ListView.builder(
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     shrinkWrap: true,
//                                     itemCount: cont.listOfInProgressTask.length,
//                                     // itemCount: 1,
//                                     itemBuilder: (context, index) {
//                                       TaskModel taskModel =
//                                           cont.listOfInProgressTask[index];
//                                       return TaskCardWidget(
//                                         taskModel: taskModel,
//                                       );
//                                     },
//                                   ),
//                           ],

//                           // ............>Completed
//                         ],
//                       ),
//                     ],
//                   );
//                 },
//               )
//             : FutureBuilder(
//                 future: getAllTakesOnThatRange(filtredDate!),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData == false) {
//                     return const Center(
//                       child: CircularProgressIndicator.adaptive(),
//                     );
//                   }
//                   return snapshot.data!.isEmpty
//                       ? TextWidget(
//                           text: 'Not Active Any Task At this Time',
//                           textStyle: KAppTypoGraphy.dialogeText18Medium)
//                       : ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.length,
//                           // itemCount: 1,
//                           itemBuilder: (context, index) {
//                             TaskModel taskModel = snapshot.data![index];
//                             return TaskCardWidget(
//                               taskModel: taskModel,
//                             );
//                           },
//                         );
//                 },
//               ));
//   }
// }
