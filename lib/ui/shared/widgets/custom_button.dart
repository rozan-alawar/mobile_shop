import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget widget;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final OutlinedBorder shap;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.widget,
    this.height = 44,
    this.width = 325,
    this.color = const Color(0xff38972E),
    this.textColor = const Color(0xffFFFFFF),
    required this.shap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        onPrimary: textColor,
        primary: color,
        fixedSize: Size(width.w, height.h),
        shape: shap,
      ),
      child: widget,
    );
  }
}
