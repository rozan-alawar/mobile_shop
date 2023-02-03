import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.width = 325,
    this.height = 60,
    this.onComplete,
    this.ispassword = false,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;
  final bool ispassword;
  final void Function(String)? onComplete;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width.w,
      height: widget.height.h,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.ispassword ? isVisible : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.white,
          suffixIcon: widget.ispassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: isVisible
                      ? Image.asset(
                          'assets/icons/Iconly/Light/Hide.png',
                          width: AppSize.s24.w,
                        )
                      : Image.asset(
                          'assets/icons/Iconly/Light/Show.png',
                          color: ColorManager.primary,
                          width: AppSize.s24.w,
                        ),
                )
              : const SizedBox(),
          prefixIcon: widget.prefixIcon == null
              ? widget.prefixIcon
              : Padding(
                  padding: EdgeInsets.only(bottom: AppPadding.p5.h),
                  child: widget.prefixIcon,
                ),
          border: InputBorder.none,
          focusColor: ColorManager.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10.r),
            borderSide: const BorderSide(color: ColorManager.primary),
          ),
          hintText: widget.hintText,
          hintStyle: getRegularStyle(
            color: ColorManager.grey,
            fonFamily: FontConstants.roboto,
          ),
          // contentPadding: const EdgeInsets.all(AppPadding.p12),
        ),
        validator: widget.validator,
        onChanged: widget.onComplete,
      ),
    );
  }
}
