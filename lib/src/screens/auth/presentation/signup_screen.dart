import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/constants/validation.dart';
import 'package:mobile_shop/src/utils/extensions/validation_extension.dart';
import 'package:mobile_shop/src/localization/locale_keys.g.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../../common widgets/custom_text_field.dart';
import '../../../common widgets/page_footer.dart';
import '../../../common widgets/page_header.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: AppPadding.p25.w),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) => Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spaces.heightSpace(40.h),
                    PageHeader(
                      firstText: LocaleKeys.sign.tr(),
                      secondText: ' ${LocaleKeys.up.tr()}',
                    ),
                    Spaces.heightSpace(10.h),
                    SubTitle(
                      text: LocaleKeys.createNewAccount.tr(),
                      fontFamily: FontConstants.roboto,
                      fontSize: FontSize.s24.sp,
                    ),
                    Spaces.heightSpace(20.h),
                    CustomTextField(
                        controller: provider.nameController,
                        hintText: LocaleKeys.fullName.tr(),
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/Iconly/Broken/Profile.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        validator: (value) =>
                            value!.isNull || !value.isValidName
                                ? 'Enter correct name'
                                : null),
                    Spaces.heightSpace(20.h),
                    CustomTextField(
                      controller: provider.emailController,
                      hintText: LocaleKeys.emailOrPhone.tr(),
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/Iconly/Broken/email.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (value) => value!.isNull || !value.isValidEmail
                          ? 'Enter correct email '
                          : null,
                    ),
                    Spaces.heightSpace(20.h),
                    CustomTextField(
                      controller: provider.phoneController,
                      hintText: LocaleKeys.phoneNumber.tr(),
                      prefixIcon: DropdownButton(
                        // isDense: true,
                        underline: const SizedBox(),
                        style: getMediumStyle(color: ColorManager.primary),
                        icon: SvgPicture.asset(
                          'assets/icons/Iconly/Light/Arrow - Down 2.svg',
                          color: ColorManager.primary,
                          fit: BoxFit.scaleDown,
                          width: 15.w,
                        ),
                        value: provider.selectedItem,
                        items: provider.items
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            provider.changeSelectedItem(value),
                      ),
                      validator: (value) {
                        return value!.isNull || !value.isValidPhone
                            ? 'Enter correct phone'
                            : null;
                      },
                    ),
                    Spaces.heightSpace(25.h),
                    CustomTextField(
                      controller: provider.passwordController,
                      ispassword: true,
                      hintText: LocaleKeys.password.tr(),
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/Iconly/Broken/Lock.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (value) =>
                          Validations.passwordValidator(value!),
                    ),
                    Spaces.heightSpace(20.h),
                    CustomTextField(
                      controller: provider.confirmPasswordController,
                      hintText: LocaleKeys.confirmPassword.tr(),
                      ispassword: true,
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/Iconly/Broken/Lock.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (value) => Validations.confirmPassValidator(
                        value!,
                        provider.passwordController.text.trim(),
                      ),
                    ),
                    Spaces.heightSpace(25.h),
                    Row(
                      children: [
                        Checkbox(
                          value: provider.isAgree,
                          onChanged: (value) => provider.agreeWithTrams(value!),
                        ),
                        SubTitle(
                          text: LocaleKeys.agreeWithTramsAndCondition.tr(),
                          fontFamily: FontConstants.roboto,
                          fontSize: FontSize.s16.sp,
                        ),
                      ],
                    ),
                    Spaces.heightSpace(20.h),
                    provider.isAgree
                        ? CustomButton(
                            onPressed: () => provider.signUp(formKey),
                            widget: provider.isloading
                                ? const CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  )
                                : Text(LocaleKeys.signUp.tr()),
                            color: ColorManager.lightBlack,
                          )
                        : AbsorbPointer(
                            child: CustomButton(
                              onPressed: () => provider.signUp(formKey),
                              widget: Text(LocaleKeys.signUp.tr()),
                              color: ColorManager.grey,
                              borderColor: ColorManager.grey,
                            ),
                          ),
                    const AspectRatio(aspectRatio: 8),
                    PageFooter(
                      firsText: LocaleKeys.haveAnAccount.tr(),
                      secondText: LocaleKeys.login.tr(),
                      onPressed: () => locator<NavigationService>()
                          .pushReplacementNamed(RouteConstants.loginRoute),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
