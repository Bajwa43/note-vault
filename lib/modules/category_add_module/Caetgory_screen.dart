import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/firebase_helper/firebase_helper.dart';
import 'package:todo_app/models/Category_add_model/category_add_model.dart';

import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/modules/home_module/pages/components/color_picker_widget.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/icon_btn.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';

import '../../widgets/txtFieldWidget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late TextEditingController categoryControler;
  CategoryAddControler ct = Get.find<CategoryAddControler>();
  // Icon? _icon;
  late Color screenPickerColor;
  // ColorSwatch? _tempMainColor;
  // Color? _tempShadeColor;

  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryControler = TextEditingController();
    screenPickerColor = Colors.blue; // Material blue.
    _controller = TextEditingController(text: 'home');
  }

  @override
  void dispose() {
    categoryControler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  CategoryAddControler cc = Get.find<CategoryAddControler>();

  @override
  Widget build(BuildContext context) {
    log('reBuild');
    return Scaffold(
      backgroundColor: KColors.backGround,
      body: SafeArea(
        child: Column(children: [
          TextWidget(
              text: 'Create new category',
              textStyle: KAppTypoGraphy.displayTitleMedium),
          TextWidget(
            text: 'Category name:',
            textStyle: KAppTypoGraphy.descriptionMedium,
            alignmentGeometry: Alignment.topLeft,
            padVerti: 10.w,
          ),
          TextFieldWidget(
            validation: (p0) {
              if (p0 == null) {
                return 'Category type';
              } else {
                return null;
              }
            },
            hintText: 'Category name',
            // hintColor: Color(0xFFAFAFAF),
            controller: categoryControler,
            textInputType: TextInputType.emailAddress,
          ),
          // .....
          TextWidget(
            text: 'Category icon:',
            textStyle: KAppTypoGraphy.descriptionMedium,
            alignmentGeometry: Alignment.topLeft,
            padVerti: 10.w,
          ),

          IconBtnWidget(
              widget: Icon(IconData(984246, fontFamily: 'MaterialIcons')),
              onTap: () {
                log(Icons.work.codePoint.toString());
                log(Icons.work.fontFamily.toString());
                // log(Icon(IconData()))
                // HelperFirebase.firestoreInstance
                ct.codePoint.value = Icons.add.codePoint;
                ct.fontFamilty.value = Icons.add.fontFamily.toString();
              }),
          TextWidget(
            text: 'Category color:',
            textStyle: KAppTypoGraphy.descriptionMedium,
            alignmentGeometry: Alignment.topLeft,
            padVerti: 10.w,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  log('reBuild2');

                  return TrigareBtn(
                    widthOfBtn: 100.w,
                    heightOfBtn: 48.h,
                    padText: const EdgeInsets.symmetric(horizontal: 5),
                    btnName: 'Select',
                    btnColor: Color.fromARGB(
                      ct.colorA.value,
                      ct.colorR.value,
                      ct.colorG.value,
                      ct.colorB.value,
                    ),
                    onPressed: () {},
                  );
                })),
          ),
          CustomColorPicker(
            colorSelectionCallBack: (p0) {
              ct.colorA.value = p0.alpha;
              ct.colorB.value = p0.blue;
              ct.colorG.value = p0.green;
              ct.colorR.value = p0.red;
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TrigareBtn(
                    flatBorderColor: Colors.transparent,
                    widthOfBtn: 153.w,
                    heightOfBtn: 48.h,
                    flatBtn: true,
                    btnName: 'cancel',
                    onPressed: () {
                      HelperFunctions.popBack(context: context);
                    }),
                TrigareBtn(
                    widthOfBtn: 153.w,
                    heightOfBtn: 48.h,
                    btnName: 'Create Category',
                    onPressed: () {
                      if (categoryControler.text.isEmpty) {
                        Get.snackbar('Type', 'Enter Category Type');
                        log('message');
                      } else {
                        CategoryAddModel obj = CategoryAddModel(
                            iconCodePoint: ct.codePoint.value,
                            iconFontFamily: ct.fontFamilty.value,
                            iconColorA: ct.colorA.value,
                            iconColorB: ct.colorB.value,
                            iconColorG: ct.colorG.value,
                            iconColorR: ct.colorR.value,
                            categoryName: categoryControler.text);
                        cc.addCatagory(obj);
                        Get.snackbar('SuccesFuly', 'Category Added');
                      }

                      // CategoryModel categoryModel = CategoryModel(
                      //     iconCategory: Icons.access_alarm,
                      //     nameOfCategory: categoryControler.text,
                      //     colorCategory: screenPickerColor);

                      // CategoryModel.listOfCateoryModel.add(categoryModel);
                      // HelperFunctions.popBack(context: context);
                    }),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(18.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }

  // ElevatedButton iconPiker(BuildContext context) {
  //   return ElevatedButton(
  //       style: ButtonStyle(
  //           backgroundColor:
  //               MaterialStatePropertyAll(KColors.bottomSheetColor)),
  //       onPressed: () async {
  //         icon = await ico.showIconPicker(context,
  //             iconPackModes: [
  //               ico.IconPack.cupertino,
  //             ],
  //             adaptiveDialog: true);
  //         if (icon != null) {
  //           setState(() {});
  //         }
  //       },
  //       child: icon != null
  //           ? Icon(
  //               icon,
  //               color: Colors.white,
  //             )
  //           : Text(
  //               'Choose Icon',
  //               style: TextStyle(color: Colors.white, fontSize: 16),
  //             ));
  // }

  // SizedBox colorPickerCard(BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: Padding(
  //       padding: const EdgeInsets.all(6),
  //       child: Card(
  //         elevation: 2,
  //         child: ColorPicker(
  //           // Use the screenPickerColor as start and active color.
  //           // color: screenPickerColor,
  //           // Update the screenPickerColor using the callback.
  //           onColorChanged: (Color color) =>
  //               setState(() => screenPickerColor = color),
  //           width: 44,
  //           height: 44,
  //           borderRadius: 22,
  //           heading: Text(
  //             'Select color',
  //             style: Theme.of(context).textTheme.headlineSmall,
  //           ),
  //           subheading: Text(
  //             'Select color shade',
  //             style: Theme.of(context).textTheme.titleSmall,
  //           ),
  //           pickerColor: null,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget color(BuildContext context, Function(Color color) onColorChanged) {
  //   return ColorPicker(
  //       // colorPickerWidth: 300,
  //       pickerColor: screenPickerColor,
  //       onColorChanged: onColorChanged);
  // }
}
