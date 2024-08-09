import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ColorPickerSecond extends StatefulWidget {
  const ColorPickerSecond({super.key});

  @override
  State<ColorPickerSecond> createState() => _ColorPickerSecondState();
}

class _ColorPickerSecondState extends State<ColorPickerSecond> {
  late Color screenPickerColor;
  // Color for the picker in a dialog using onChanged.
  late Color dialogPickerColor;
  // Color for picker using the color select dialog.
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.blue; // Material blue.
    dialogPickerColor = Colors.red; // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('FlexColorPicker Demo'),
        ),
        body: ListView(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            children: <Widget>[
              // Show the selected color.
              ListTile(
                title: const Text('Select color below to change this color'),
                // subtitle:
                //     Text('${ColorTools.materialNameAndCode(screenPickerColor)} '
                //         'aka ${ColorTools.nameThatColor(screenPickerColor)}'),
                trailing: ColorIndicator(
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  color: screenPickerColor,
                ),
              ),

              // Show the color picker in sized box in a raised card.
              colorPickerCard(context),
            ]));
  }

  SizedBox colorPickerCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Card(
          elevation: 2,
          child: ColorPicker(
            // Use the screenPickerColor as start and active color.
            color: screenPickerColor,
            // Update the screenPickerColor using the callback.
            onColorChanged: (Color color) =>
                setState(() => screenPickerColor = color),
            width: 44,
            height: 44,
            borderRadius: 22,
            heading: Text(
              'Select color',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subheading: Text(
              'Select color shade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
