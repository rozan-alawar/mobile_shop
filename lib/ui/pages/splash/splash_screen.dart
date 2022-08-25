import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/utils/l10n/locale_keys.g.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:mobile_shop/utils/styles/font_manager.dart';
import 'package:mobile_shop/utils/styles/styles_manager.dart';
import '../../../core/services/navigation_service.dart';
import '../../../utils/routes/routes_const.dart';
import '../../../utils/locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initFun();
    super.initState();
  }

  initFun() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    locator<NavigationService>().pushReplacementNamed(onboardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 103.w,
                height: 77.h,
              ),
              const SizedBox(height: 20),
              Text(
                LocaleKeys.mobileShop.tr(),
                style: getBoldStyle(
                  color: ColorManager.black,
                  fonFamily: FontConstants.novaSlim,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
