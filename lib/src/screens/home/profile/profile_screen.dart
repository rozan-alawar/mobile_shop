import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/common%20widgets/title_text.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../common widgets/custom_list_tile.dart';
import '../../../common widgets/loading_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => provider.user == null
            ? const LoadingIndiaor()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s6.r),
                      ),
                      width: 325.w,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s6.r),
                            child: CachedNetworkImage(
                              key: UniqueKey(),
                              imageUrl: provider.user!.image!,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.scaleDown,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          TitleText(text: provider.user!.name!),
                          InkWell(
                            onTap: () => locator<NavigationService>().pushNamed(
                                routeName: RouteConstants.editProfileRoute),
                            child: SvgPicture.asset(
                              'assets/icons/Iconly/Light/Arrow-Right2.svg',
                            ),
                          )
                        ],
                      ),
                    ),
                    Spaces.heightSpace(AppSize.s32.h),
                    const Divider(color: ColorManager.grey, height: 1),
                    Spaces.heightSpace(AppSize.s40.h),
                    ActionList(
                      image: 'assets/icons/Iconly/Bold/Setting.svg',
                      title: 'Settings',
                      onTap: () => locator<NavigationService>()
                          .pushNamed(routeName: RouteConstants.settingsRoute),
                    ),
                    ActionList(
                      image: 'assets/icons/Iconly/Bold/gg_track.svg',
                      title: 'Order Tracking',
                      onTap: () {},
                    ),
                    ActionList(
                      image: 'assets/icons/fluent_payment-24-regular.svg',
                      title: 'Payment Method',
                      onTap: () {},
                    ),
                    ActionList(
                      image: 'assets/icons/Iconly/Light/Wallet.svg',
                      title: 'My purchess',
                      onTap: () {},
                    ),
                    ActionList(
                      image: 'assets/icons/basic/location_outline.svg',
                      title: 'Address',
                      onTap: () => locator<NavigationService>()
                          .pushNamed(routeName: RouteConstants.addressRoute),
                    ),
                    ActionList(
                      image: 'assets/icons/Iconly/Light/privacy.svg',
                      title: 'Privacy',
                      onTap: () {},
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) => ActionList(
                        image: 'assets/icons/Iconly/Light/Logout.svg',
                        title: 'Log out',
                        onTap: () => provider.logout(),
                      ),
                    ),
                    Spaces.heightSpace(AppSize.s20.h),
                  ],
                ),
              ),
      ),
    );
  }
}
