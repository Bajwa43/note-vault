import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      required this.textStyle,
      this.alignmentGeometry = Alignment.center,
      this.padHori = 20,
      this.padVerti = 40,
      this.textAlign});
  final String text;
  final TextStyle textStyle;
  final AlignmentGeometry alignmentGeometry;
  final double padHori;
  final double padVerti;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padHori, vertical: padVerti),
        child: Text(text, style: textStyle, textAlign: textAlign),
      ),
    );
  }
}
