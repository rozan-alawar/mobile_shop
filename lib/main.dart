import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/src/core/providers/auth_provider.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/app.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:provider/provider.dart';

import 'src/core/providers/page_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(
    EasyLocalization(
      path: 'assets/l10n',
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
        Locale('de'),
      ],
      fallbackLocale: const Locale('en'),
      saveLocale: false,
      child: MultiProvider(providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeDataProvider>(
          create: (context) => HomeDataProvider(),
        ),
      ], child: const MyApp()),
    ),
  );
}
