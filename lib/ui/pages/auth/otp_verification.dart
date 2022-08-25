import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/core/services/navigation_service.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_button.dart';
import 'package:mobile_shop/utils/l10n/locale_keys.g.dart';
import 'package:mobile_shop/utils/locator.dart';
import 'package:mobile_shop/utils/routes/routes_const.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:mobile_shop/utils/styles/font_manager.dart';
import 'package:mobile_shop/utils/styles/pinput_theme.dart';
import 'package:mobile_shop/utils/styles/styles_manager.dart';
import 'package:mobile_shop/utils/styles/values_manager.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Spaces.heightSpace(130.h),
                Image.asset('assets/images/auth/Phone Verification.png'),
                Spaces.heightSpace(25.h),
                Text(
                  LocaleKeys.phoneVerification.tr(),
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: 22.sp,
                  ),
                ),
                Spaces.heightSpace(15.h),
                Text(
                  LocaleKeys.phoneVerificationDescription.tr(),
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                    color: ColorManager.grey,
                    fontSize: 14.sp,
                  ),
                ),
                Spaces.heightSpace(AppSize.s24.h),
                Pinput(
                  length: 4,
                  keyboardType: TextInputType.number,
                  closeKeyboardWhenCompleted: true,
                  preFilledWidget: Text(
                    '0',
                    style: getRegularStyle(
                      color: ColorManager.grey,
                      fonFamily: FontConstants.roboto,
                    ),
                  ),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>().pushNamed(loginRoue);
                  },
                  widget: Text(LocaleKeys.verifyPhoneNumber.tr()),
                  shap: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Spaces.heightSpace(AppSize.s20.h),
                Text(
                  LocaleKeys.editPhoneNumber.tr(),
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: 11.sp,
                  ),
                ),
                Spaces.heightSpace(AppSize.s20.h),
                CustomButton(
                  onPressed: () {},
                  widget: Text(
                    LocaleKeys.sendAgain.tr(),
                    style: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: 11.sp,
                    ),
                  ),
                  shap: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
