import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    required this.text,
    this.fontSize = FontSize.s15,
    this.fontFamily = FontConstants.openSans,
    this.color = ColorManager.grey,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: getRegularStyle(
        color: color,
        fontSize: fontSize,
        fonFamily: fontFamily,
      ),
    );
  }
}
