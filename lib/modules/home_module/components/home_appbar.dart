import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/modules/profile_mudule/profile_screen.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

import '../../../data/app_assets.dart';
import '../../../data/Constants/colors.dart';
import '../../../data/Constants/size.dart';
import '../../../widgets/txtWidget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24, top: 13.w),
      child: SizedBox(
        height: 42.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(
                KAppAssets.sortImage,
                width: 42.w,
              ),
            ),
            TextWidget(
                text: 'Index',
                padHori: 0,
                padVerti: 0,
                textStyle: KAppTypoGraphy.displayTitleMedium),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context: context, screen: ProfileScreen());
              },
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 42.w,
                  // height: 42.h,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    KAppAssets.personImage,
                    // width: 42.w,
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
