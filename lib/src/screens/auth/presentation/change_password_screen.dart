import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../common widgets/custom_button.dart';
import '../../../common widgets/custom_text_field.dart';
import '../../../common widgets/leading_icon.dart';
import '../../../common widgets/sub_title.dart';
import '../../../common widgets/title_text.dart';
import '../../../constants/validation.dart';
import '../../../localization/locale_keys.g.dart';
import '../../../router/routes_const.dart';
import '../../../utils/locator.dart';
import '../../../utils/styles/color_manager.dart';
import '../../../utils/styles/values_manager.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        toolbarHeight: 70.h,
        leading: const LeadingIcon(),
        backgroundColor: ColorManager.white,
        actions: [
          SvgPicture.asset('assets/icons/Iconly/Light/Danger Circle.svg'),
          Spaces.widthSpace(AppSize.s20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
        child: Consumer<AuthProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleText(text: 'Create new password'),
              Spaces.heightSpace(AppSize.s16.h),
              const SubTitle(
                text:
                    'Your new password must be different from previous used passwords.',
              ),
              Spaces.heightSpace(AppSize.s40.h),
              CustomTextField(
                controller: value.passwordController,
                ispassword: true,
                hintText: LocaleKeys.password.tr(),
                prefixIcon:
                    SvgPicture.asset('assets/icons/Iconly/Broken/Lock.svg'),
                validator: (value) => Validations.passwordValidator(value!),
              ),
              Spaces.heightSpace(AppSize.s24.h),
              CustomTextField(
                controller: value.confirmPasswordController,
                ispassword: true,
                hintText: LocaleKeys.confirmPassword.tr(),
                prefixIcon:
                    SvgPicture.asset('assets/icons/Iconly/Broken/Lock.svg'),
                validator: (value) => Validations.passwordValidator(value!),
              ),
              Spaces.heightSpace(AppSize.s24.h),
              CustomButton(
                  onPressed: () {
                    locator<NavigationService>()
                        .pushNamed(routeName: RouteConstants.loginRoute);
                  },
                  widget: const Text('Confirm')),
            ],
          ),
        ),
      ),
    );
  }
}
