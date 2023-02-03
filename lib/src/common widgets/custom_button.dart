import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget widget;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double raduis;
  final bool isCircularButton;
  final Color borderColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.widget,
    this.height = 44,
    this.width = 325,
    this.color = const Color(0xff38972E),
    this.textColor = const Color(0xffFFFFFF),
    this.borderColor = ColorManager.primary,
    this.raduis = 6,
    this.isCircularButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: textColor,
        backgroundColor: color,
        fixedSize: Size(width.w, height.h),
        shape: isCircularButton
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(raduis),
                side: BorderSide(
                  color: borderColor,
                ),
              ),
      ),
      child: widget,
    );
  }
}
