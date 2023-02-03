import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/common%20widgets/app_bar.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../utils/locator.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Category',
      ),
      body: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => provider.categoryLoading
            ? const Center(child: LoadingIndiaor())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: provider.categoreis.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            provider.categoryIndex = index;
                            provider.getCategoryDetails(
                                provider.categoreis[index].id!);
                            locator<NavigationService>().pushNamed(
                                routeName: RouteConstants.categoryDetailsRoute);
                          },
                          child: Material(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(15.r),
                            child: Padding(
                              padding: EdgeInsets.all(AppPadding.p22.w),
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: CachedNetworkImage(
                                      key: UniqueKey(),
                                      imageUrl:
                                          provider.categoreis[index].image ??
                                              "",
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  Spaces.heightSpace(AppSize.s6.h),
                                  Text(
                                    provider.categoreis[index].name ?? "",
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
      ),
    );
  }
}
