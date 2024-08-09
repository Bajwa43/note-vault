import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/app_assets.dart';

import '../../../utiles/Constants/colors.dart';
import '../../../utiles/Constants/size.dart';
import '../../../widgets/txtWidget.dart';

class ApplicationCardWidget extends StatelessWidget {
  final Widget image;

  const ApplicationCardWidget(
      {super.key,
      required this.titile,
      required this.description,
      required this.image});
  final String titile;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Container(
          width: 327.w,
          // height: 72.h,
          height: 56.h,
          decoration: BoxDecoration(
              color: KColors.bottomSheetColor,
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: image,
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
                          text: titile,
                          textStyle: KAppTypoGraphy.Month14N),
                      TextWidget(
                        alignmentGeometry: Alignment.topLeft,
                        padHori: 0,
                        padVerti: 0,
                        text: description,
                        textStyle: KAppTypoGraphy.year10N,
                      ),
                    ]),
                const Spacer(),
                VerticalDivider(
                  color: KColors.txtColor,
                  indent: 7,
                  endIndent: 7,
                ),
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(KAppAssets.infoImage),
                ),
              ],
            ),
          )),
    );
  }
}
