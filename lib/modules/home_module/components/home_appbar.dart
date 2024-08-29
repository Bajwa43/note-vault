import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/profile_controller.dart';
import 'package:todo_app/modules/profile_mudule/profile_screen.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

import '../../../data/app_assets.dart';
import '../../../data/Constants/colors.dart';
import '../../../data/Constants/size.dart';
import '../../../widgets/txtWidget.dart';

class HomeAppBarWidget extends StatelessWidget {
  HomeAppBarWidget({super.key});
  final ProfileController _pc = Get.find<ProfileController>();

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
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 42.w,
                  // height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: _pc.userModel.value!.imagePath == ''
                      ? Image.asset(KAppAssets.personImage)
                      : Image.network(_pc.userModel.value!.imagePath),
                )),
          ],
        ),
      ),
    );
  }
}
