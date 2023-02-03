import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.whiteSmoke,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.lightPrimary,
    // ripple effect color
    // cardview theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      centerTitle: true,
      color: ColorManager.whiteSmoke,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      iconTheme: const IconThemeData(
        color: ColorManager.black,
      ),
      titleTextStyle: getSemiBoldStyle(
        fontSize: FontSize.s17.sp,
        color: ColorManager.black,
        fonFamily: FontConstants.openSans,
      ),
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.darkGrey,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getSemiBoldStyle(
              color: ColorManager.white,
              fontSize: FontSize.s16.sp,
            ),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
  );
}
