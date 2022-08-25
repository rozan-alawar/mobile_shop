import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/core/services/navigation_service.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_button.dart';
import 'package:mobile_shop/utils/constants/controllers.dart';
import 'package:mobile_shop/utils/extensions/validation_extension.dart';
import 'package:mobile_shop/utils/l10n/locale_keys.g.dart';
import 'package:mobile_shop/utils/locator.dart';
import 'package:mobile_shop/utils/routes/routes_const.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:mobile_shop/utils/styles/font_manager.dart';
import 'package:mobile_shop/utils/styles/styles_manager.dart';
import 'package:mobile_shop/utils/styles/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/page_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: AppPadding.p25.w),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spaces.heightSpace(120.h),
                  PageHeader(
                    firstText: LocaleKeys.sign.tr(),
                    secondText: ' ${LocaleKeys.up.tr()}',
                  ),
                  Spaces.heightSpace(10.h),
                  Text(
                    LocaleKeys.createNewAccount.tr(),
                    style: getRegularStyle(
                        color: ColorManager.grey,
                        fontSize: 24.sp,
                        fonFamily: FontConstants.roboto),
                  ),
                  Spaces.heightSpace(20.h),
                  CustomTextField(
                    controller: nameController,
                    hintText: LocaleKeys.fullName.tr(),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Iconly/Broken/Profile.svg',
                    ),
                    validator: (value) {
                      return value!.isNotNull || value.isValidName
                          ? null
                          : 'Enter correct name';
                    },
                  ),
                  Spaces.heightSpace(20.h),
                  CustomTextField(
                    controller: emailController,
                    hintText: LocaleKeys.emailOrPhone.tr(),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Iconly/Broken/email.svg',
                    ),
                    validator: (value) {
                      return value!.isNotNull ||
                              value.isValidEmail ||
                              value.isValidPhone
                          ? null
                          : 'Enter correct email or phone';
                    },
                  ),
                  Spaces.heightSpace(20.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: LocaleKeys.password.tr(),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Iconly/Broken/Lock.svg',
                    ),
                    validator: (value) {
                      return value!.isNotNull || value.isValidPassword
                          ? null
                          : 'Enter correct password';
                    },
                  ),
                  Spaces.heightSpace(20.h),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: LocaleKeys.confirmPassword.tr(),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Iconly/Broken/Lock.svg',
                    ),
                    validator: (value) {
                      return value!.isNotNull || value.isValidPassword
                          ? null
                          : 'Enter correct email or phone';
                    },
                  ),
                  Spaces.heightSpace(25.h),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        LocaleKeys.agreeWithTramsAndCondition.tr(),
                        style: getRegularStyle(
                          color: ColorManager.grey,
                          fonFamily: FontConstants.roboto,
                        ),
                      ),
                    ],
                  ),
                  Spaces.heightSpace(20.h),
                  CustomButton(
                    onPressed: () {
                      locator<NavigationService>()
                          .pushNamed(phoneVerificationRoue);
                    },
                    widget: Text(LocaleKeys.signUp.tr()),
                    shap: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    color: ColorManager.lightBlack,
                  ),
                  const AspectRatio(aspectRatio: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.haveAnAccount.tr(),
                        style: getSemiBoldStyle(color: ColorManager.grey),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.login.tr(),
                          style: getSemiBoldStyle(color: ColorManager.primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
