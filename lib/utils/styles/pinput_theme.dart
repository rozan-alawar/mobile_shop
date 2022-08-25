import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 74.w,
  height: 59.h,
  // margin: const EdgeInsets.all(AppMargin.m12),
  decoration: BoxDecoration(
    color: ColorManager.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: ColorManager.grey),
  ),
);

final focusedPinTheme = PinTheme(
  width: 74.w,
  height: 59.h,
  decoration: BoxDecoration(
    color: ColorManager.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: ColorManager.primary,
    ),
  ),
);

// final focusedPinTheme = PinTheme(

//   decoration: defaultPinTheme.decoration!.copyWith(
//     border: Border.all(
//       color: ColorManager.primary,
//     ),
//   ),
// );
