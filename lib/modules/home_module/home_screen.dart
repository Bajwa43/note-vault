import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/modules/home_module/components/home_appbar.dart';
import 'package:todo_app/modules/home_module/components/no_screen.dart';
import 'package:todo_app/modules/home_module/components/on_screen/on_screen.dart';
import 'package:todo_app/Dialogs/task_priority_dialog.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import '../../widgets/Buttons/icon_btn.dart';
import '../../widgets/Buttons/trigar_btn.dart';
import 'components/home_bottom_navbar.dart';
import 'components/on_focus_textFormFieldWidget.dart';
import '../../Dialogs/category_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController taskControler;
  late TextEditingController descriptionControler;
  late TextEditingController searchbarControler;
  bool onTaskFocus = false;
  bool onDescriptionFocus = false;
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();

  @override
  void initState() {
    super.initState();
    taskControler = TextEditingController();
    descriptionControler = TextEditingController();
    searchbarControler = TextEditingController();
    onTaskFocus = true;
    // focusNode.requestFocus();
    // focusNode.addListener(() {
    // setState(() {});
    // });
  }

  @override
  void dispose() {
    focusNode.dispose();
    taskControler.dispose();
    descriptionControler.dispose();
    searchbarControler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const HomeAppBarWidget(),
            OnScreen(controller: searchbarControler)
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
                      controller: taskControler,
                      // taskOnTap: () {},
                    ),
                    OnFocusTextFormFieldWidget(
                      hintText: 'description',
                      controller: descriptionControler,
                      // taskOnTap: () {},
                    ),
                    Row(
                      children: [
                        IconBtnWidget(
                          padRight: padingbBtwIcons,
                          widget: Icon(
                            Icons.alarm_add_outlined,
                            color: KColors.txtColor,
                            size: 24.sp,
                          ),
                          onTap: () async {
                            DateTime? datetime = await showOmniDateTimePicker(
                                context: context, theme: ThemeData.dark());
                            log('datetime:  ${datetime} ');
                          },
                        ),
                        // ....
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
                                    onPressed: () {}),
                              ),
                            );
                          },
                        ),
                        // ....
                        IconBtnWidget(
                          padRight: padingbBtwIcons,
                          widget: SvgPicture.asset(KAppAssets.flgImage),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => TaskPriorityDialog(
                                      trigarBtnName: 'Save',
                                      onCanceled: () {},
                                      onPressed: () {},
                                    ));
                          },
                        ),
                        Expanded(child: SizedBox()),
                        IconBtnWidget(
                          padRight: 0,
                          widget: SvgPicture.asset(KAppAssets.sendImage),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
