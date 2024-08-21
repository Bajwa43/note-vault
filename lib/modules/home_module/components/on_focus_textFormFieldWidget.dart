import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/Constants/colors.dart';
import '../../../data/Constants/size.dart';

class OnFocusTextFormFieldWidget extends StatelessWidget {
  const OnFocusTextFormFieldWidget(
      {super.key,
      // required this.taskOnTap,
      this.autoFocus = false,
      required this.hintText,
      this.hintTextStyle,
      required this.controller,
      this.validation});

  // final Function() taskOnTap;
  final bool autoFocus;
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController controller;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: TextFormField(
            validator: validation,
            controller: controller,
            autofocus: autoFocus,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  hintTextStyle ?? const TextStyle(color: KColors.hintTxtColor),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.sp,
                ),
                borderSide: BorderSide(
                    color: KColors.hintTxtColor,
                    width: 2.w,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter),
              ),
            ),
            cursorColor: KColors.txtColor,
            style: KAppTypoGraphy.descriptionLarge,
            // onTap: taskOnTap,
          ),
        ),
        // Padding(
        //     padding: EdgeInsets.symmetric(vertical: 5.w),
        //     child: TextFormField(
        //         focusNode: focusNode,
        //         cursorColor: KColors.txtColor,
        //         // autofocus: true,
        //         decoration: focusNode.hasFocus
        //             ? InputDecoration(
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(
        //                     10.sp,
        //                   ),
        //                 ),
        //                 focusedBorder: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(
        //                     10.sp,
        //                   ),
        //                   borderSide: BorderSide(
        //                       color: KColors.hintTxtColor,
        //                       width: 2.w,
        //                       style: BorderStyle.solid,
        //                       strokeAlign: BorderSide.strokeAlignCenter),
        //                 ),
        //                 hintText: ' Description',
        //                 hintStyle: TextStyle(color: KColors.hintTxtColor))
        //             : InputDecoration.collapsed(
        //                 hintText: "Whrite a Task",
        //                 hintStyle: KAppTypoGraphy.descriptionHintTextLarge),
        //         style: KAppTypoGraphy.descriptionLarge,
        //         onTap: descripyionOnTap))
      ],
    );
  }
}



// ...................................

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../utiles/Constants/colors.dart';
// import '../../../utiles/Constants/size.dart';

// class OnFocusTextFormFieldWidget extends StatelessWidget {
//   const OnFocusTextFormFieldWidget({
//     super.key,
//     required this.taskOnTap,
//     required this.descripyionOnTap,
//     required this.onTaskFocus,
//     required this.onDescriptionFocus,
//   });


//   final Function() taskOnTap;
//   final Function() descripyionOnTap;
//   final bool onTaskFocus;
//   final bool onDescriptionFocus;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 5.w),
//           child: TextFormField(
            
//               cursorColor: KColors.hintTxtColor,
//               // autofocus: true,
//               decoration: onTaskFocus
//                   ? InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.sp)),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                           10.sp,
//                         ),
//                         borderSide: BorderSide(
//                             color: KColors.hintTxtColor,
//                             width: 2.w,
//                             style: BorderStyle.solid,
//                             strokeAlign: BorderSide.strokeAlignCenter),
//                       ),
//                       hintText: 'Whrite a Task',
//                       hintStyle: TextStyle(color: KColors.hintTxtColor))
//                   : InputDecoration.collapsed(
//                       hintText: "Whrite a Task",
//                       hintStyle: KAppTypoGraphy.descriptionHintTextLarge),
//               style: KAppTypoGraphy.descriptionLarge,
//               onTap: taskOnTap),
//         ),
//         Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.w),
//             child: TextFormField(
//                 cursorColor: KColors.hintTxtColor,
//                 // autofocus: true,
//                 decoration: onDescriptionFocus
//                     ? InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10.sp,
//                           ),
//                           borderSide: BorderSide(
//                               color: KColors.hintTxtColor,
//                               width: 2.w,
//                               style: BorderStyle.solid,
//                               strokeAlign: BorderSide.strokeAlignCenter),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.sp),
//                         ),
//                         hintText: ' Description',
//                         hintStyle: TextStyle(color: KColors.hintTxtColor))
//                     : InputDecoration.collapsed(
//                         hintText: 'Description',
//                         hintStyle: KAppTypoGraphy.descriptionHintTextLarge),
//                 style: KAppTypoGraphy.descriptionLarge,
//                 onTap: descripyionOnTap))
//       ],
//     );
//   }
// }
