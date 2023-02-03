import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/styles_manager.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key, required this.title, this.withSeeAll = false})
      : super(key: key);

  final String title;
  final bool withSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s17.sp),
        ),
        withSeeAll
            ? TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: getRegularStyle(
                      color: ColorManager.primary, fontSize: FontSize.s12.sp),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
