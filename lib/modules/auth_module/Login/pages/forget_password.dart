import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/utiles/app_validation.dart';
import 'package:todo_app/widgets/Buttons/topBackBtn.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtFieldWidget.dart';
import 'package:todo_app/widgets/txtWidget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopLeftBtn(onPressed: () {}),
          TextWidget(
              padVerti: 18.h,
              alignmentGeometry: Alignment.topLeft,
              text: 'Forget password',
              textStyle: KAppTypoGraphy.displayTitleMedium),
          FittedBox(
            child: TextWidget(
                padVerti: 0.h,
                text: 'Please enter your email to reset the password',
                textStyle: KAppTypoGraphy.description2Medium),
          ),
          TextWidget(
            text: 'Your Email',
            textStyle: KAppTypoGraphy.descriptionMedium,
            alignmentGeometry: Alignment.topLeft,
            padVerti: 20.w,
          ),
          TextFieldWidget(
            padverti: 0,
            hintText: 'Enter Your Email',
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
            validation: (value) {
              if (!AppValidation.validateEmail(value!)) {
                return 'Invalid email address';
              }
              return null;
            },
          ),
          TrigareBtn(
              padVerti: 26.h,
              widthOfBtn: KAppTypoGraphy.trigarLargeBtnWidth,
              heightOfBtn: 46.h,
              btnName: 'Reset Password',
              onPressed: () async {
                await AuthService.forgetPasswordWithEmail(
                    _emailController.text.trim());
              })
        ],
      ),
    );
  }
}
