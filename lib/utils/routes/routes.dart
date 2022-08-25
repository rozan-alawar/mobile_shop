import 'package:flutter/material.dart';
import 'package:mobile_shop/ui/pages/auth/login_screen.dart';
import 'package:mobile_shop/ui/pages/auth/otp_verification.dart';
import 'package:mobile_shop/ui/pages/auth/phone_verification_screen.dart';
import 'package:mobile_shop/ui/pages/auth/signup_screen.dart';
import 'package:mobile_shop/ui/pages/home/home_screen.dart';
import 'package:mobile_shop/ui/pages/onboarding/onboarding_screen.dart';
import 'package:mobile_shop/ui/pages/splash/splash_screen.dart';
import 'package:mobile_shop/utils/routes/routes_const.dart';

class RouteGenerator {
  static Route<dynamic> generateRoue(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case signupRoue:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case phoneVerificationRoue:
        return MaterialPageRoute(
          builder: (context) => PhoneVerificationScreen(),
        );
      case otpRoue:
        return MaterialPageRoute(
          builder: (context) => const OtpVerificationScreen(),
        );
      case loginRoue:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
