import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/common%20widgets/app_bar.dart';
import 'package:mobile_shop/src/common%20widgets/section_header.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/home_data_provider.dart';
import '../../../../utils/styles/color_manager.dart';
import '../../../../utils/styles/font_manager.dart';
import '../../../../utils/styles/styles_manager.dart';
import '../../../../utils/styles/values_manager.dart';
import '../../../../common widgets/grid_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDataProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBarWidget(
          title: provider.categoreis[provider.categoryIndex].name!,
          action: [
            Badge(
                badgeContent: Text(provider.cartItems.length.toString(),
                    style: getSemiBoldStyle(
                        color: ColorManager.white, fontSize: FontSize.s12.sp)),
                position: BadgePosition.topEnd(top: 10, end: -10),
                badgeColor: ColorManager.primary,
                animationType: BadgeAnimationType.scale,
                child: SvgPicture.asset('assets/icons/Iconly/Light/Buy-1.svg')),
            Spaces.widthSpace(AppSize.s24.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s6.w),
                child: CachedNetworkImage(
                  imageUrl: provider.banners[0].image!,
                ),
              ),
              Spaces.heightSpace(AppSize.s32.h),
              const SectionHeader(title: 'In the spotlight', withSeeAll: true),
              GridWidget(
                provider: provider,
                list: provider.categoryProducts,
              ),
              Spaces.heightSpace(AppSize.s32.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s6.w),
                child: CachedNetworkImage(
                  imageUrl: provider.banners[2].image!,
                ),
              ),
              Spaces.heightSpace(100.h),
            ],
          ),
        ),
      ),
    );
  }
}
