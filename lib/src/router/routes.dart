import 'package:flutter/material.dart';
import 'package:mobile_shop/src/core/providers/map_provider.dart';
import 'package:mobile_shop/src/screens/auth/presentation/change_password_screen.dart';
import 'package:mobile_shop/src/screens/auth/presentation/check_mail_screen.dart';
import 'package:mobile_shop/src/screens/auth/presentation/login_screen.dart';
import 'package:mobile_shop/src/screens/auth/presentation/otp_verification.dart';
import 'package:mobile_shop/src/screens/auth/presentation/reset_password.dart';
import 'package:mobile_shop/src/screens/auth/presentation/signup_screen.dart';
import 'package:mobile_shop/src/screens/home/home/categories/category_details_screen.dart';
import 'package:mobile_shop/src/screens/home/home/categories/category_screen.dart';
import 'package:mobile_shop/src/screens/home/home/search/search_screen.dart';
import 'package:mobile_shop/src/screens/home/main_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/address/address_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/settings/help_center_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/settings/notification_screen.dart';
import 'package:mobile_shop/src/common%20widgets/product/product_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/edit_profile_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/settings/settings.dart';
import 'package:mobile_shop/src/screens/intro/onboarding_screen.dart';
import 'package:mobile_shop/src/screens/intro/splash_screen.dart';
import 'package:mobile_shop/src/common%20widgets/error404_screen.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:provider/provider.dart';

import '../screens/home/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteConstants.onboardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case RouteConstants.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteConstants.signupRoute:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      case RouteConstants.otpRoute:
        return MaterialPageRoute(
          builder: (context) => const OtpVerificationScreen(),
        );
      case RouteConstants.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteConstants.restPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );
      case RouteConstants.checkMailRoute:
        return MaterialPageRoute(
          builder: (context) => const CheckMailScreen(),
        );
      case RouteConstants.changePasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        );
      case RouteConstants.mainRoute:
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
        );
      case RouteConstants.categoriesRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case RouteConstants.settingsRoute:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case RouteConstants.editProfileRoute:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case RouteConstants.productRoute:
        return MaterialPageRoute(
          builder: (context) => ProductScreen(),
        );
      case RouteConstants.helpCenterRoute:
        return MaterialPageRoute(
          builder: (context) => const HelpCenterScreen(),
        );
      case RouteConstants.notificationRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case RouteConstants.categoryDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoryDetailsScreen(),
        );
      case RouteConstants.searchRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case RouteConstants.addressRoute:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MapProvider>(
              create: (context) => MapProvider(), child: const AddressScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
