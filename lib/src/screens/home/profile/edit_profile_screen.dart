import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/custom_text_field.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../utils/locator.dart';
import '../../../utils/styles/values_manager.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => locator<NavigationService>().pop(),
          child: SvgPicture.asset(
            'assets/icons/Iconly/Light/Arrow - Left 2.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        title: const Text(
          'Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p25.w, vertical: AppPadding.p25.w),
          child: Consumer<HomeDataProvider>(
            builder: (context, provider, child) => Column(
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s10.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      provider.image != null
                          ? Image.file(
                              provider.image!,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.fill,
                            )
                          : const FlutterLogo(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10.r),
                          color: ColorManager.grey.withOpacity(0.2),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.pickImage();
                        },
                        child: SvgPicture.asset(
                            'assets/icons/Iconly/Bold/Camera alt.svg'),
                      )
                    ],
                  ),
                ),
                Spaces.heightSpace(AppSize.s32.h),
                const Divider(color: ColorManager.grey, height: 0.5),
                Spaces.heightSpace(AppSize.s32.h),
                CustomTextField(
                  controller: provider.phoneController,
                  hintText: 'phone',
                  prefixIcon: null,
                  validator: (p0) {
                    return null;
                  },
                ),
                Spaces.heightSpace(AppSize.s14.h),
                CustomTextField(
                  controller: provider.nameController,
                  hintText: 'name',
                  prefixIcon: null,
                  validator: (p0) {
                    return null;
                  },
                ),
                Spaces.heightSpace(AppSize.s14.h),
                CustomTextField(
                  controller: provider.emailController,
                  hintText: 'email',
                  prefixIcon: null,
                  validator: (p0) {
                    return null;
                  },
                ),
                Spaces.heightSpace(AppSize.s32.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alternate mobile number details',
                    style: getSemiBoldStyle(),
                  ),
                ),
                Spaces.heightSpace(AppSize.s16.h),
                CustomTextField(
                  controller: provider.phoneController,
                  hintText: 'phone',
                  prefixIcon: null,
                  validator: (p0) {
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SubTitle(
                    text: 'This will help recover your account if needed',
                    fontSize: FontSize.s11.sp,
                  ),
                ),
                Spaces.heightSpace(AppSize.s12.h),
                CustomTextField(
                  controller: provider.nameController,
                  hintText: 'name',
                  prefixIcon: null,
                  validator: (p0) {
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SubTitle(
                    text: 'Add a name that helps you identify alternate number',
                    fontSize: FontSize.s11.sp,
                  ),
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                  onPressed: () {},
                  widget: const Text('Change password'),
                  color: Colors.transparent,
                  textColor: ColorManager.darkGrey,
                  borderColor: ColorManager.darkGrey,
                ),
                Spaces.heightSpace(AppSize.s12.h),
                CustomButton(
                    onPressed: () => provider.updateProfile(),
                    widget: const Text('Edit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
