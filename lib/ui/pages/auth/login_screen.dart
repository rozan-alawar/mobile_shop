import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_button.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_text_field.dart';
import 'package:mobile_shop/ui/shared/widgets/page_header.dart';
import 'package:mobile_shop/utils/constants/controllers.dart';
import 'package:mobile_shop/utils/l10n/locale_keys.g.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';

import '../../../utils/styles/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsetsDirectional.all(25.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PageHeader(firstText: 'Welcom', secondText: ' back!'),
              Spaces.heightSpace(AppSize.s20.h),
              CustomTextField(
                controller: emailController,
                hintText: 'email',
                prefixIcon:
                    SvgPicture.asset('assets/icons/Iconly/Broken/Profile.svg'),
                validator: (p0) {
                  return null;
                },
              ),
              Spaces.heightSpace(AppSize.s12.h),
              CustomTextField(
                controller: emailController,
                hintText: 'password',
                prefixIcon:
                    SvgPicture.asset('assets/icons/Iconly/Broken/Lock.svg'),
                validator: (p0) {
                  return null;
                },
              ),
              Spaces.heightSpace(AppSize.s24.h),
              CustomButton(
                onPressed: () {},
                widget: Text(LocaleKeys.login.tr()),
                shap: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: ColorManager.lightBlack,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
