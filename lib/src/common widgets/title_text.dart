import 'package:flutter/cupertino.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    this.fontSize = FontSize.s22,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: getBoldStyle(
        color: ColorManager.black,
        fontSize: fontSize,
      ),
    );
  }
}
