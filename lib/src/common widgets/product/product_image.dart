import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/models/products.dart';
import '../../utils/styles/values_manager.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
      {Key? key, required this.controller, required this.product})
      : super(key: key);
  final Product product;

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/component/product_bg.png',
            height: 414.h,
            width: 414.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              itemCount: product.images!.length,
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: product.images![index],
                width: 250.w,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SmoothPageIndicator(
              count: product.images!.length,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorManager.primary,
                dotWidth: AppSize.s10.w,
                dotHeight: AppSize.s10.w,
              ),
              controller: controller,
            ),
          ),
          Positioned(
            right: AppPadding.p25.w,
            top: AppPadding.p84.h,
            child: product.inFavorites ?? true
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: ColorManager.primary,
                    child: Image.asset(
                      'assets/icons/Iconly/Bold/Heart.png',
                      width: 14.w,
                      height: 14.h,
                      color: ColorManager.white,
                    ),
                  )
                : Image.asset(
                    'assets/icons/Iconly/Light/Heart.png',
                    width: 15.w,
                    height: 15.h,
                  ),
          ),
        ],
      ),
    );
  }
}
