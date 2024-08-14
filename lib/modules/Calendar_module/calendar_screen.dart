import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/components/home_bottom_navbar.dart';
import 'package:todo_app/modules/home_module/components/on_screen/components/decided_task_card.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../../Dialogs/bottom_sheet_add_dialog.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  late List<DecidedTaskModel> listOfDecidedTasks;

  bool completdFocus = true;
  bool todayFocus = false;

  var _focusDate = DateTime.now();
  bool btnHide = false;

  late TextEditingController taskControler;

  late TextEditingController descriptionControler;
  final TaskController tc = Get.find<TaskController>();

  @override
  void initState() {
    super.initState();
    listOfDecidedTasks = DecidedTaskModel.listOfDecidedTask;
    taskControler = TextEditingController();
    descriptionControler = TextEditingController();
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
          child: Column(
            children: [
              TextWidget(
                  padVerti: 10,
                  text: 'Calendar',
                  textStyle: KAppTypoGraphy.displayTitleLarge),
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
                        DateFormat("yyyy").format(DateTime.now()),
                        style: KAppTypoGraphy.year10N,
                      ),
                    ]),
                  ),
                  controller: _controller,
                  firstDate: DateTime(2023),
                  focusDate: _focusDate,
                  lastDate: DateTime(2023, 12, 31),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _focusDate = selectedDate;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                child: Column(
                  children: [
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
                            flatBtn: todayFocus,
                            onPressed: () {
                              setState(() {
                                completdFocus = true;
                                todayFocus = false;
                                btnHide = false;
                              });
                            },
                          ),
                          TrigareBtn(
                            flatBorderColor: KColors.hintTxtColor,
                            heightOfBtn: 49.h,
                            widthOfBtn: 137.w,
                            flatBtn: completdFocus,
                            btnName: 'Completed',
                            onPressed: () {
                              setState(() {
                                completdFocus = false;
                                todayFocus = true;
                                btnHide = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    TaskCardWidget(
                        btnHide: btnHide, taskModel: tc.listOfTask[0]),
                    TaskCardWidget(
                        btnHide: btnHide, taskModel: tc.listOfTask[0]),

                    // ListView.builder(
                    //   itemCount: listOfDecidedTasks.length,
                    //   itemBuilder: (context, index) => TaskCardWidget(index: index),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: HomeBottomNavbarWidget(
        //     onPressed: showBottomSheetAddBtn(
        //         context: context,
        //         taskControler: taskControler,
        //         descriptionControler: descriptionControler),
        //     index: 1));
        bottomNavigationBar: HomeBottomNavbarWidget(
            onPressed: () {
              setState(() {
                print('sdfghj');
              });
            },
            index: 1));
  }
}
