import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/utiles/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/models/Category_add_model/category_add_model.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_priority_model.dart';
import 'package:todo_app/modules/category_add_module/Caetgory_screen.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import '../modules/home_module/controller/task_controller.dart';
import '../utiles/Constants/colors.dart';

// int checkedEditedIndex = 0;

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key, required this.optionalWidget});
  final Widget optionalWidget;

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final TaskController tc = Get.find<TaskController>();
  final CategoryAddControler cc = Get.find<CategoryAddControler>();

  List<CategoryAddModel> categoryAddModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(cc.listOfCategories.length.toString());
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

                GetBuilder(
                  init: CategoryAddControler(),
                  builder: (controller) {
                    if (controller.listOfCategories.isEmpty) {
                      return Text("No Category");
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.listOfCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return buildWidget(index);
                      },
                    );
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
    bool checked = index == cc.checkedEditedIndex.value;

    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            cc.checkedEditedIndex.value = index;
          });
          if (index == cc.listOfCategories.length - 1) {
            Get.toNamed('/Category');
          }
        });

        // INSERTING THE DATA OF SLELECTED CATEGORY IN TASK DECIDED CONTROLER
        tc.iconColorA.value = cc.listOfCategories[index].iconColorA;
        tc.iconColorB.value = cc.listOfCategories[index].iconColorB;
        tc.iconColorG.value = cc.listOfCategories[index].iconColorG;
        tc.iconColorR.value = cc.listOfCategories[index].iconColorR;
        tc.categoryName.value = cc.listOfCategories[index].categoryName;

        tc.iconCodePoint.value = cc.listOfCategories[index].iconCodePoint;
        tc.iconFontFamily.value = cc.listOfCategories[index].iconFontFamily;
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
                    color: Color.fromARGB(
                        cc.listOfCategories[index].iconColorA,
                        cc.listOfCategories[index].iconColorR,
                        cc.listOfCategories[index].iconColorG,
                        cc.listOfCategories[index].iconColorB),
                    borderRadius: BorderRadius.circular(2)),
                child: Icon(
                  IconData(cc.listOfCategories[index].iconCodePoint,
                      fontFamily: cc.listOfCategories[index].iconFontFamily),
                  size: 32.w,
                )
                // Icon(,
                //     size: 32.w),
                ),

            // ..

            TextWidget(
                padHori: 0,
                padVerti: 0,
                text: cc.listOfCategories[index].categoryName,
                textStyle: KAppTypoGraphy.categoryTextStyle14M)
          ],
        ),
      ),
    );
  }
}
