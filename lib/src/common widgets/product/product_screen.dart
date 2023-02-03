import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:provider/provider.dart';

import '../../core/providers/home_data_provider.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/snack_bar_service.dart';
import '../../data/models/products.dart';
import '../../utils/locator.dart';
import '../../utils/styles/values_manager.dart';
import 'product_description.dart';
import 'product_image.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  Product? product;

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        extendBodyBehindAppBar: true,
        appBar: appBar(),
        body: Consumer<HomeDataProvider>(
          builder: (context, provider, child) {
            product = provider.product;
            return provider.product != null
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImage(
                          controller: controller,
                          product: product!,
                        ),
                        Spaces.heightSpace(AppSize.s32.h),
                        ProductDesription(
                          product: product!,
                        )
                      ],
                    ),
                  )
                : const LoadingIndiaor();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Material(
            elevation: 50,
            child: SizedBox(
              height: 92.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: AppSize.s44.w,
                      height: AppSize.s44.h,
                      onPressed: () {},
                      widget: SvgPicture.asset(
                          'assets/icons/Iconly/Light/Heart.svg',
                          color: ColorManager.white),
                    ),
                    Consumer<HomeDataProvider>(
                      builder: (context, provider, child) => CustomButton(
                        width: AppSize.s265.w,
                        height: AppSize.s44.h,
                        onPressed: () {
                          product!.inCart == false
                              ? provider.addToCart(product!.id!)
                              : locator<SnackBarSrevie>()
                                  .showSnackBar('Product already in cart');
                        },
                        color: ColorManager.black,
                        widget: const Text('Add to cart'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () => locator<NavigationService>().pop(),
        child: SvgPicture.asset(
          'assets/icons/Iconly/Light/Arrow - Left 2.svg',
          width: 24.w,
          height: 24.h,
          fit: BoxFit.scaleDown,
        ),
      ),
      actions: [
        Consumer<HomeDataProvider>(
          builder: (context, value, child) => Badge(
              badgeContent: Text(value.cartItems.length.toString(),
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s12.sp)),
              position: BadgePosition.topEnd(top: 10, end: -10),
              badgeColor: ColorManager.primary,
              animationType: BadgeAnimationType.scale,
              child: SvgPicture.asset('assets/icons/Iconly/Light/Buy-1.svg')),
        ),
        Spaces.widthSpace(AppSize.s24.w),
      ],
    );
  }
}
