import 'package:flutter/material.dart';
import 'package:mobile_shop/utils/styles/values_manager.dart';
import '../../../utils/styles/color_manager.dart';
import '../../../utils/styles/font_manager.dart';
import '../../../utils/styles/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.width = 325,
    this.height = 60,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: prefixIcon,
          ),
          hintText: hintText,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle: getRegularStyle(
            color: ColorManager.grey,
            fonFamily: FontConstants.roboto,
          ),
          contentPadding: const EdgeInsets.all(AppPadding.p18),
        ),
        validator: validator,
      ),
    );
  }
}
