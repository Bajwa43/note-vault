import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_priority_model.dart';
import 'package:todo_app/modules/home_module/pages/Caetgory_screen.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import '../utiles/Constants/colors.dart';

int checkedEditedIndex = 0;

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key, required this.optionalWidget});
  final Widget optionalWidget;

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: KColors.bottomSheetColor,
            borderRadius: BorderRadius.circular(4.w)),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(
                    padVerti: 10.w,
                    text: 'Choose Category',
                    textStyle: KAppTypoGraphy.displayTitleSmall),
                // .......
                Divider(
                  endIndent: 8.w,
                  indent: 8.w,
                  color: KColors.dividerColor,
                  height: 25.h,
                  thickness: 2.w,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: CategoryModel.listOfCateoryModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return buildWidget(index);
                  },
                ),
                // ..........

                widget.optionalWidget
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildWidget(int index) {
    bool checked = index == checkedEditedIndex;

    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            checkedEditedIndex = index;
          });
          if (index == CategoryModel.listOfCateoryModel.length - 1) {
            HelperFunctions.navigateToScreen(
                context: context, screen: CategoryScreen());
            log('Create ');
          }
        });
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: checked
                      ? Border.all(color: Colors.blue.shade900, width: 3)
                      : null,
                  color: CategoryModel.listOfCateoryModel[index].colorCategory,
                  borderRadius: BorderRadius.circular(2)),
              child: Icon(CategoryModel.listOfCateoryModel[index].iconCategory,
                  size: 32.w),
            ),

            // ..

            TextWidget(
                padHori: 0,
                padVerti: 0,
                text: CategoryModel.listOfCateoryModel[index].nameOfCategory,
                textStyle: KAppTypoGraphy.categoryTextStyle14M)
          ],
        ),
      ),
    );
  }
}
