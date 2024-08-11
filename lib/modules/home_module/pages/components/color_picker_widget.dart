import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

const List<ColorSwatch> accentColors = <ColorSwatch>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.yellowAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
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
