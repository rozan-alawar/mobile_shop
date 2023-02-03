import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/title_text.dart';
import 'package:mobile_shop/src/localization/locale_keys.g.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/pinput_theme.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:pinput/pinput.dart';

import '../../../common widgets/sub_title.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Spaces.heightSpace(130.h),
                Image.asset('assets/images/auth/Phone Verification.png'),
                Spaces.heightSpace(25.h),
                TitleText(text: LocaleKeys.phoneVerification.tr()),
                Spaces.heightSpace(15.h),
                SubTitle(text: LocaleKeys.phoneVerificationDescription.tr()),
                Spaces.heightSpace(AppSize.s24.h),
                Pinput(
                  length: 4,
                  keyboardType: TextInputType.number,
                  closeKeyboardWhenCompleted: true,
                  preFilledWidget: const SubTitle(
                    text: '0',
                    fontFamily: FontConstants.roboto,
                  ),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>()
                        .pushNamed(routeName: RouteConstants.loginRoute);
                  },
                  widget: Text(LocaleKeys.verifyPhoneNumber.tr()),
                ),
                Spaces.heightSpace(AppSize.s24.h),
                Text(
                  LocaleKeys.editPhoneNumber.tr(),
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                    color: ColorManager.lightBlack,
                    fontSize: 11.sp,
                  ),
                ),
                Spaces.heightSpace(AppSize.s15.h),
                CustomButton(
                  onPressed: () {},
                  widget: Text(
                    LocaleKeys.sendAgain.tr(),
                    style: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: 11.sp,
                    ),
                  ),
                  width: 89.w,
                  height: 38.h,
                  color: ColorManager.lightPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
