import 'dart:developer';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../data/app_assets.dart';
import '../modules/home_module/components/on_focus_textFormFieldWidget.dart';
import '../utiles/Constants/colors.dart';
import '../utiles/Constants/size.dart';
import '../widgets/Buttons/icon_btn.dart';
import '../widgets/Buttons/trigar_btn.dart';
import '../widgets/txtWidget.dart';
import 'category_dialog.dart';
import 'task_priority_dialog.dart';

showBottomSheetAddBtn(
    {required BuildContext context,
    required TextEditingController taskControler,
    required TextEditingController descriptionControler}) {
  double padingbBtwIcons = 30.w;
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
