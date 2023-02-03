import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/color_manager.dart';
import '../../utils/styles/font_manager.dart';
import '../../utils/styles/styles_manager.dart';

class DiscountNumber extends StatelessWidget {
  const DiscountNumber({Key? key, required this.discount, this.raduis = 4})
      : super(key: key);

  final int? discount;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 21.h,
      decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(raduis.r)),
      child: Text(
        '- $discount%',
        textAlign: TextAlign.center,
        style: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.s12.sp),
      ),
    );
  }
}
