import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/pages/edit_task_screen/edit_task_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

class TaskCardWidget extends StatelessWidget {
  final Color? btnColor;

  const TaskCardWidget(
      {super.key,
      required this.index,
      required this.list,
      this.btnHide = false,
      this.btnColor});
  final int index;
  final List<dynamic> list;
  final btnHide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: InkWell(
        onTap: () {
          HelperFunctions.navigateToScreen(
              context: context,
              screen: EditTaskScreen(indexOfSelectedTask: index));
        },
        child: Container(
            width: 327.w,
            height: 72.h,
            decoration: BoxDecoration(
                color: KColors.bottomSheetColor,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SizedBox(
                      // width: 16.w,
                      // height: 16.h,
                      child: SvgPicture.asset(KAppAssets.ringImage),
                      // child: Checkbox(
                      //     fillColor: MaterialStatePropertyAll(KColors.txtColor),
                      //     shape: const CircleBorder(),
                      //     value: false,
                      //     onChanged: (value) {}),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                            alignmentGeometry: Alignment.topLeft,
                            padVerti: 0,
                            padHori: 0,
                            text: list[index].taskTitle,
                            textStyle: KAppTypoGraphy.descriptionMedium),
                        TextWidget(
                          alignmentGeometry: Alignment.topLeft,
                          padHori: 0,
                          padVerti: 0,
                          text: list[index].dateTime,
                          textStyle: KAppTypoGraphy.dateTimeTextStyle14N,
                        ),
                      ]),
                  const Spacer(),
                  btnHide
                      ? const SizedBox.shrink()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TrigareBtn(
                                btnColor: btnColor,
                                heightOfBtn: 29.h,
                                widthOfBtn: null,
                                showBothIconWithText: true,
                                padOfIcon: EdgeInsets.all(1),
                                padText: EdgeInsets.all(3),
                                btnTextStyle:
                                    KAppTypoGraphy.descriptionTextMedium,
                                icon: Icon(Icons.home,
                                    size: 14.w, color: KColors.txtColor),
                                // flatBtn: true,
                                btnName: list[index].category.toString(),
                                onPressed: () {}),
                          ),
                        ),
                  btnHide
                      ? SizedBox.shrink()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: TrigareBtn(
                              heightOfBtn: 29.h,
                              widthOfBtn: 60.w,
                              showBothIconWithText: true,
                              padOfIcon: EdgeInsets.all(0),
                              btnTextStyle:
                                  KAppTypoGraphy.descriptionHintTextMedium,
                              icon: Image.asset(KAppAssets.flagImage,
                                  width: 14.w, color: KColors.hintTxtColor),
                              flatBtn: true,
                              btnName: list[index].priority.toString(),
                              onPressed: () {}),
                        )
                ],
              ),
            )),
      ),
    );
  }
}
