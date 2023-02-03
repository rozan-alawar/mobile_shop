import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/data/models/products.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';

import '../../utils/styles/values_manager.dart';
import 'discount.dart';
import '../rating_widget.dart';

class ProductDesription extends StatelessWidget {
  const ProductDesription({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p25.w, right: AppPadding.p16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 200,
                  child: Text(
                    product.name!,
                    overflow: TextOverflow.visible,
                    style: getBoldStyle(fontSize: FontSize.s18.sp),
                  )),
              Spaces.widthSpace(AppSize.s16.w),
              product.discount == 0 || product.discount == null
                  ? const SizedBox()
                  : DiscountNumber(raduis: 32, discount: product.discount),
              const Spacer(),
              Text(
                '${product.price} AUD',
                style: getSemiBoldStyle(color: ColorManager.primary),
              ),
            ],
          ),
          Spaces.heightSpace(AppPadding.p20.h),
          Row(
            children: [
              SubTitle(
                text: 'PRODUCT ID : ${product.id}',
                fontSize: FontSize.s16.sp,
              )
            ],
          ),
          Spaces.heightSpace(AppSize.s14),
          const Rating(itemCount: 5, initialRating: 4),
          Spaces.heightSpace(AppSize.s44.h),
          Text(
            'Special features',
            style: getSemiBoldStyle(fontSize: FontSize.s17.sp),
          ),
          Spaces.heightSpace(AppSize.s22.h),
          Text(
            product.description!,
            style: getRegularStyle(fontSize: FontSize.s15.sp),
          ),
          Spaces.heightSpace(AppSize.s24.h),
        ],
      ),
    );
  }
}
