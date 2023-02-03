import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/custom_text_field.dart';
import 'package:mobile_shop/src/common%20widgets/leading_icon.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/common%20widgets/title_text.dart';
import 'package:mobile_shop/src/utils/extensions/validation_extension.dart';
import 'package:mobile_shop/src/localization/locale_keys.g.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../router/routes_const.dart';
import '../../../utils/locator.dart';
import '../../../utils/styles/color_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                const TitleText(text: 'Reset password'),
                Spaces.heightSpace(AppSize.s16.h),
                const SubTitle(
                  text:
                      'Enter the email associated with your account and we’ll send an email with instructions to reset your password!',
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomTextField(
                  controller: value.emailController,
                  hintText: LocaleKeys.email.tr(),
                  prefixIcon: null,
                  validator: (value) => value!.isNull || !value.isValidEmail
                      ? 'Enter correct email'
                      : null,
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                    onPressed: () {
                      locator<NavigationService>()
                          .pushNamed(routeName: RouteConstants.checkMailRoute);
                    },
                    widget: const Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
