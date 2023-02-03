import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/values_manager.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, this.itemCount = 1, this.initialRating = 1})
      : super(key: key);
  final int itemCount;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          itemCount == 1 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          itemSize: AppSize.s20,
          itemBuilder: (context, index) => const Icon(
            Icons.star_rounded,
            color: Colors.amber,
          ),
          itemCount: itemCount,
          glowColor: ColorManager.grey,
          unratedColor: Colors.amber.withOpacity(0.3),
          initialRating: initialRating,
          ignoreGestures: true,
          onRatingUpdate: (value) {},
        ),
        Spaces.heightSpace(AppSize.s8),
        Text(
          '4.5 (3k review)',
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s11.sp,
          ),
        ),
      ],
    );
  }
}
