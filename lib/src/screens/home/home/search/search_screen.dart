import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/app_bar.dart';
import 'package:mobile_shop/src/common%20widgets/custom_text_field.dart';
import 'package:mobile_shop/src/common%20widgets/grid_widget.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Search'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
          child: Consumer<HomeDataProvider>(
            builder: (context, provider, child) => Column(
              children: [
                Row(
                  children: [
                    CustomTextField(
                      width: 240.w,
                      height: 50.h,
                      controller: provider.searchController,
                      hintText: 'Search',
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/Iconly/Light/Search.svg',
                        color: ColorManager.grey,
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (p0) {
                        return null;
                      },
                      onComplete: (text) =>
                          provider.search(provider.searchController.text),
                    ),
                    Spaces.widthSpace(AppSize.s10.w),
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Card(
                        color: ColorManager.black,
                        child: SvgPicture.asset(
                          'assets/icons/Iconly/Light/Filter.svg',
                          color: ColorManager.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
                Spaces.heightSpace(AppPadding.p25.h),
                GridWidget(list: provider.searchProducts, provider: provider),
                Spaces.heightSpace(AppPadding.p25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
