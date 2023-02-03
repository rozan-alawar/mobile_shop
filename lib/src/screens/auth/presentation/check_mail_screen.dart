import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/common%20widgets/leading_icon.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';

import '../../../core/services/navigation_service.dart';
import '../../../common widgets/custom_button.dart';
import '../../../common widgets/sub_title.dart';
import '../../../common widgets/title_text.dart';
import '../../../router/routes_const.dart';
import '../../../utils/locator.dart';
import '../../../utils/styles/values_manager.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: ColorManager.white,
          leading: const LeadingIcon(),
          actions: [
            SvgPicture.asset('assets/icons/Iconly/Light/Danger Circle.svg'),
            Spaces.widthSpace(AppSize.s20.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Spaces.heightSpace(100.h),
                Image.asset('assets/images/auth/Phone Verification.png'),
                Spaces.heightSpace(AppSize.s40.h),
                const TitleText(text: 'Check your mail'),
                Spaces.heightSpace(15.h),
                const SubTitle(
                    text:
                        'We have sent a password recover instructions to your email.'),
                Spaces.heightSpace(AppSize.s24.h),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>().pushReplacementNamed(
                        RouteConstants.changePasswordRoute);
                  },
                  widget: const Text('Open email'),
                ),
                Spaces.heightSpace(AppSize.s16.h),
                CustomButton(
                  onPressed: () {
                    locator<NavigationService>()
                        .pushReplacementNamed(RouteConstants.loginRoute);
                  },
                  color: ColorManager.lightPrimary,
                  widget: Text(
                    'i’ll confirm latter',
                    style: getSemiBoldStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
