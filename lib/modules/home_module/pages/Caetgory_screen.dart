import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
// import 'package:flutter_iconpicker/Models/icon_pack.dart';
// import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/modules/home_module/pages/components/color_picker_widget.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';
// import 'package:flutter_iconpicker/flutter_iconpicker.dart' as ico;
// import '../../../utiles/Constants/colors.dart';
import '../../../widgets/txtFieldWidget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late TextEditingController categoryControler;
  IconData? icon;
  late Color screenPickerColor;

  ColorSwatch? _tempMainColor;
  Color? _tempShadeColor;
  ColorSwatch? _mainColor = Colors.blue;
  Color? _shadeColor = Colors.blue[800];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryControler = TextEditingController();
    screenPickerColor = Colors.blue; // Material blue.
  }

  @override
  void dispose() {
    categoryControler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // iconPiker(context),

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
              child: TrigareBtn(
                  // widthOfBtn: null,
                  widthOfBtn: 100.w,
                  heightOfBtn: 48.h,
                  padText: EdgeInsets.symmetric(horizontal: 5),
                  btnName: 'Select',
                  btnColor: _tempShadeColor,
                  // onPressed: () {
                  //   HelperFunctions.navigateToScreen(
                  //       context: context, screen: ColorPickerWidget());
                  // }
                  onPressed: () {}),
            ),
          ),
          CustomColorPicker(
            colorSelectionCallBack: (p0) {
              setState(() {
                _tempShadeColor = p0;
              });
            },
          ),

          // ColorPickerWidget(),
          // ColorIndicator(

          //     // width: 44,
          //     // height: 44,
          //     // borderRadius: 22,
          //     // color: screenPickerColor,
          //     ),
          Spacer(),
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
                      CategoryModel categoryModel = CategoryModel(
                          iconCategory: Icons.access_alarm,
                          nameOfCategory: categoryControler.text,
                          colorCategory: screenPickerColor);

                      CategoryModel.listOfCateoryModel.add(categoryModel);
                      HelperFunctions.popBack(context: context);
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
                setState(() => _mainColor = _tempMainColor);
                setState(() => _shadeColor = _tempShadeColor);
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

  Widget color(BuildContext context, Function(Color color) onColorChanged) {
    return ColorPicker(
        // colorPickerWidth: 300,
        pickerColor: screenPickerColor,
        onColorChanged: onColorChanged);
  }
}

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({super.key, required this.colorSelectionCallBack});
  final Function(Color) colorSelectionCallBack;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          child: CustomColor(
            colorList: accentColors,
            onColorSelect: (color) {
              widget.colorSelectionCallBack(color);
            },
          ),
        )
      ],
    );
  }
}

List<Color> list = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.yellow,
  Colors.pink
];

class CustomColor extends StatelessWidget {
  const CustomColor(
      {super.key, required this.colorList, required this.onColorSelect});
  final List<Color> colorList;
  final Function(Color color) onColorSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          colorList.length,
          (index) => Padding(
            padding: EdgeInsets.all(7.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                onColorSelect(colorList[index]);
              },
              child: Container(
                height: 36.r,
                width: 36.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorList[index],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
