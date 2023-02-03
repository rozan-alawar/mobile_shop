import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/custom_text_field.dart';
import 'package:mobile_shop/src/common%20widgets/page_header.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/constants/validation.dart';
import 'package:mobile_shop/src/utils/extensions/validation_extension.dart';
import 'package:mobile_shop/src/localization/locale_keys.g.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/services/navigation_service.dart';
import '../../../common widgets/page_footer.dart';
import '../../../utils/locator.dart';
import '../../../utils/styles/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 750.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                child: Consumer<AuthProvider>(
                  builder: (context, provider, child) => Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spaces.heightSpace(230.h),
                        PageHeader(
                          firstText: LocaleKeys.welcom.tr(),
                          secondText: ' ${LocaleKeys.back.tr()}',
                        ),
                        Spaces.heightSpace(AppSize.s40.h),
                        CustomTextField(
                          controller: provider.emailController,
                          hintText: LocaleKeys.email.tr(),
                          prefixIcon: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              'assets/icons/Iconly/Broken/Profile.svg'),
                          validator: (value) =>
                              value!.isNull || !value.isValidEmail
                                  ? 'Enter correct email'
                                  : null,
                        ),
                        Spaces.heightSpace(AppSize.s12.h),
                        CustomTextField(
                          controller: provider.passwordController,
                          ispassword: true,
                          hintText: LocaleKeys.password.tr(),
                          prefixIcon: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              'assets/icons/Iconly/Broken/Lock.svg'),
                          validator: (value) =>
                              Validations.passwordValidator(value!),
                        ),
                        Spaces.heightSpace(AppSize.s15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: provider.saveUser,
                                  onChanged: (value) =>
                                      provider.rememberUser(value!),
                                ),
                                SubTitle(
                                  text: 'Remember me',
                                  fontSize: FontSize.s12.sp,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                hoverColor: ColorManager.primary,
                                onTap: () {
                                  locator<NavigationService>().pushNamed(
                                      routeName:
                                          RouteConstants.restPasswordRoute);
                                },
                                child: SubTitle(
                                  text: LocaleKeys.forgetPassword.tr(),
                                  fontSize: FontSize.s12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spaces.heightSpace(AppSize.s40.h),
                        Center(
                          child: CustomButton(
                            onPressed: () => provider.login(loginKey),
                            widget: provider.isloading
                                ? const CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  )
                                : Text(LocaleKeys.login.tr()),
                            color: ColorManager.black,
                          ),
                        ),
                        Expanded(child: Container()),
                        PageFooter(
                          firsText: LocaleKeys.haventAnAccount.tr(),
                          secondText: LocaleKeys.signUp.tr(),
                          onPressed: () => locator<NavigationService>()
                              .pushReplacementNamed(RouteConstants.signupRoute),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
