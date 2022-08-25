import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/core/services/navigation_service.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_button.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_text_field.dart';
import 'package:mobile_shop/utils/constants/controllers.dart';
import 'package:mobile_shop/utils/l10n/locale_keys.g.dart';
import 'package:mobile_shop/utils/locator.dart';
import 'package:mobile_shop/utils/routes/routes_const.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:mobile_shop/utils/styles/styles_manager.dart';
import 'package:mobile_shop/utils/styles/values_manager.dart';

class PhoneVerificationScreen extends StatelessWidget {
  PhoneVerificationScreen({Key? key}) : super(key: key);

  List<String> items = ['00', '01', '970', '02'];

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
                CustomTextField(
                  controller: phoneController,
                  hintText: LocaleKeys.phoneNumber.tr(),
                  prefixIcon: DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    menuMaxHeight: 100.h,
                    icon: SvgPicture.asset(
                      'assets/icons/Iconly/Light/Arrow - Down 2.svg',
                      width: 15.w,
                    ),
                    hint: const Text('00'),
                    items: items
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  validator: (p0) {
                    return null;
                  },
                ),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>().pushNamed(otpRoue);
                  },
                  widget: Text(LocaleKeys.sendOTP.tr()),
                  shap: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
