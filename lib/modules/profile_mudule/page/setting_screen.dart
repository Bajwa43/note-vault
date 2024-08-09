import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../../data/app_assets.dart';
import '../../../widgets/Buttons/topBackBtn.dart';
import '../components/profile_optional_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                children: [
                  TopLeftBtn(
                      isOffPad: true,
                      onPressed: () =>
                          HelperFunctions.popBack(context: context)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 75),
                    child: TextWidget(
                        text: 'Settings',
                        textStyle: KAppTypoGraphy.profileTitleStyle),
                  ),
                ],
              ),

              // ..........................

              TextWidget(
                  padHori: 0,
                  padVerti: 4,
                  alignmentGeometry: Alignment.topLeft,
                  text: 'Settings',
                  textStyle: KAppTypoGraphy.profileLabelStyle),

              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.editImage),
                titleOfTask: 'Change app color',
                onPressed: () {},
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.textImage),
                titleOfTask: 'Change app trypography',
                onPressed: () {},
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.languageImage),
                titleOfTask: 'Change app language',
                onPressed: () {},
              ),

              // ................
              TextWidget(
                  padHori: 0,
                  padVerti: 4,
                  alignmentGeometry: Alignment.topLeft,
                  text: 'Settings',
                  textStyle: KAppTypoGraphy.profileLabelStyle),

              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.importImage),
                titleOfTask: 'Import from Google calendar',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
