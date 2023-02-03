import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:provider/provider.dart';

import '../../../../utils/styles/values_manager.dart';
import '../../../../common widgets/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Notification',
        action: [
          SvgPicture.asset('assets/icons/Iconly/Light/Menu.svg'),
          Spaces.widthSpace(AppPadding.p25.w),
        ],
      ),
      body: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => provider.notification.isEmpty
            ? const LoadingIndiaor()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.notification.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: AppPadding.p25.w,
                      end: AppPadding.p25.w,
                      bottom: AppPadding.p16.h),
                  child: Container(
                    width: 325.w,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p25, vertical: AppPadding.p8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s15.r),
                        color: ColorManager.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          provider.notification[index].title!,
                          style: getSemiBoldStyle(),
                        ),
                        Text(
                          provider.notification[index].message!,
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
