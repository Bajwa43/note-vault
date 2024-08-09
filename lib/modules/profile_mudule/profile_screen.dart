import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Dialogs/dialog.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/models/completed_task.dart';
import 'package:todo_app/models/decided_teask_model.dart';
import 'package:todo_app/modules/home_module/components/home_bottom_navbar.dart';
import 'package:todo_app/modules/home_module/components/on_focus_textFormFieldWidget.dart';
import 'package:todo_app/modules/profile_mudule/components/profile_optional_widget.dart';
import 'package:todo_app/modules/profile_mudule/page/setting_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/negative_btn_withIcon_widget.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/Buttons/txt_btn.dart';
import 'package:todo_app/widgets/txtFieldWidget.dart';
import 'package:todo_app/widgets/txtWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameControler;
  late TextEditingController oldPasswordControler;
  late TextEditingController newPasswordControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameControler = TextEditingController();
    oldPasswordControler = TextEditingController();
    newPasswordControler = TextEditingController();
  }

  @override
  void dispose() {
    nameControler.dispose();
    oldPasswordControler.dispose();
    newPasswordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          child: Column(
            children: [
              TextWidget(
                  padVerti: 24,
                  text: 'Profile',
                  textStyle: KAppTypoGraphy.profileTitleStyle),
              Container(
                  // width: 85,
                  height: 85,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(KAppAssets.profileImage)),

              TextWidget(
                  padHori: 0,
                  padVerti: 10,
                  text: 'Fahad Ali',
                  textStyle: KAppTypoGraphy.profileNameStyle),

              // ........................BUTTONS

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TrigareBtn(
                      widthOfBtn: 153.w,
                      heightOfBtn: 58.h,
                      // flatBtn: true,
                      btnColor: KColors.taskboxColor,
                      btnTextStyle: KAppTypoGraphy.profileOptionStyleAndBtnText,
                      btnName:
                          '${DecidedTaskModel.listOfDecidedTask.length.toString()} Task left',
                      onPressed: () {}),
                  TrigareBtn(
                      // padVerti: 0,
                      btnColor: KColors.taskboxColor,
                      widthOfBtn: 153.w,
                      heightOfBtn: 58.h,
                      btnTextStyle: KAppTypoGraphy.profileOptionStyleAndBtnText,
                      btnName:
                          '${CompletedTaskModel.listOFCompletedTask.length.toString()} Task done',
                      onPressed: () {}),
                ],
              ),

              SizedBox(height: 28.h),
              // .................
              TextWidget(
                  padHori: 0,
                  padVerti: 4,
                  alignmentGeometry: Alignment.topLeft,
                  text: 'Setting',
                  textStyle: KAppTypoGraphy.profileLabelStyle),

              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.settingImage),
                titleOfTask: 'App Settings',
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context: context, screen: const SettingScreen());
                },
              ),

              TextWidget(
                  padHori: 0,
                  padVerti: 4,
                  alignmentGeometry: Alignment.topLeft,
                  text: 'Account',
                  textStyle: KAppTypoGraphy.profileLabelStyle),

              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.accountImage),
                titleOfTask: 'Change account name',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: DialogWidget(
                            dialogTitle: 'Change account name',
                            onCanceled: () {
                              HelperFunctions.popBack(context: context);
                            },
                            onPressed: () {},
                            trigarBtnName: 'Edit',
                            heightOfDialog: 200.h,
                            widget: OnFocusTextFormFieldWidget(
                              controller: nameControler,
                              hintText: 'Enter name',
                              hintTextStyle:
                                  KAppTypoGraphy.descriptionHintTextLarge,
                              autoFocus: true,
                              // taskOnTap: () {},
                            )),
                      );
                    },
                  );
                },
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.keyImage),
                titleOfTask: 'Change account password',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          child: DialogWidget(
                              trigarBtnName: 'Edit',
                              dialogTitle: 'Change account Password',
                              onPressed: () {},
                              onCanceled: () {
                                HelperFunctions.popBack(context: context);
                              },
                              heightOfDialog: 350,
                              widget: Column(
                                children: [
                                  TextFieldWidget(
                                      obscureText: true,
                                      padhori: 0,
                                      hintText: 'Enter Old Password',
                                      controller: oldPasswordControler),
                                  TextFieldWidget(
                                      obscureText: true,
                                      padhori: 0,
                                      hintText: 'Enter New Password',
                                      controller: newPasswordControler),
                                ],
                              )));
                    },
                  );
                },
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.cameraImage),
                titleOfTask: 'Change account image',
                onPressed: () {
                  changeAccountBottomSheet(context);
                },
              ),
              // ............
              TextWidget(
                  padHori: 0,
                  padVerti: 4,
                  alignmentGeometry: Alignment.topLeft,
                  text: 'Uptodo',
                  textStyle: KAppTypoGraphy.profileLabelStyle),

              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.aboutImage),
                titleOfTask: 'About us',
                onPressed: () {},
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.infoImage),
                titleOfTask: 'FAQ',
                onPressed: () {},
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.helpImage),
                titleOfTask: 'Help & feedback',
                onPressed: () {},
              ),
              ProfileOptionalWidget(
                iconImage: SvgPicture.asset(KAppAssets.likeImage),
                titleOfTask: 'Support US',
                onPressed: () {},
              ),

              Align(
                alignment: Alignment.topLeft,
                child: NegativeBtnWithIconWidget(
                    btnText: '  Log out   ',
                    widget: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(
                        KAppAssets.logOutImage,
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: HomeBottomNavbarWidget(onPressed: () {}, index: 3),
    );
  }

  Future<dynamic> changeAccountBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            // width: 327.w,
            // height: 360.h,
            height: 244,
            decoration: BoxDecoration(
                color: KColors.bottomSheetColor,
                borderRadius: BorderRadius.circular(4.w)),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                      padVerti: 10.w,
                      text: 'Change account Image',
                      textStyle: KAppTypoGraphy.displayTitleSmall),
                  // .......
                  Divider(
                    endIndent: 8.w,
                    indent: 8.w,
                    color: KColors.dividerColor,
                    height: 25.h,
                    thickness: 2.w,
                  ),

                  TextButtonWidget(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Task Picher Clicked')));
                      },
                      nameOfBtn: 'Tack picture',
                      padding: EdgeInsets.all(5),
                      btnStyle: KAppTypoGraphy.description2Medium),
                  TextButtonWidget(
                      onTap: () {},
                      nameOfBtn: 'Import from gallery',
                      padding: EdgeInsets.all(5),
                      btnStyle: KAppTypoGraphy.description2Medium),
                  TextButtonWidget(
                      onTap: () {},
                      nameOfBtn: 'Import from Google Drive',
                      padding: EdgeInsets.all(5),
                      btnStyle: KAppTypoGraphy.description2Medium),

                  // TrigareBtn(
                  //     widthOfBtn: 85.w,
                  //     btnName: 'Tack picture',
                  //     flatBtn: true,
                  //     flatBorderColor: Colors.transparent,
                  //     onPressed: () {}),
                  // TrigareBtn(
                  //     widthOfBtn: 136.w,
                  //     btnName: 'Import from gallery',
                  //     flatBtn: true,
                  //     flatBorderColor: Colors.transparent,
                  //     onPressed: () {}),
                  // TrigareBtn(
                  //     widthOfBtn: 182.w,
                  //     btnName: 'Import from Google Drive',
                  //     flatBtn: true,
                  //     flatBorderColor: Colors.transparent,
                  //     onPressed: () {}),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
