import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/core/services/snack_bar_service.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes.dart';
import 'package:mobile_shop/src/utils/styles/theme_manager.dart';
import 'package:provider/provider.dart';

import 'core/providers/page_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageProvider>(
      create: (context) => PageProvider(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: RouteConstants.splashRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          scaffoldMessengerKey: locator<SnackBarSrevie>().scaffoldMessengerKey,
        ),
      ),
    );
  }
}
