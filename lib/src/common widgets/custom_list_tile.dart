import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/values_manager.dart';

class ActionList extends StatelessWidget {
  const ActionList({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p14.h),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s6.r),
        ),
        tileColor: ColorManager.white,
        onTap: onTap,
        leading: SvgPicture.asset(image, color: ColorManager.primary),
        title: Text(
          title,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s14.sp,
          ),
        ),
      ),
    );
  }
}
