import 'package:flutter/material.dart';
import 'package:mobile_shop/src/data/models/auth_response.dart';
import 'package:mobile_shop/src/data/models/user.dart';
import 'package:mobile_shop/src/utils/locator.dart';

import '../../data/api/api_service/api_services.dart';
import '../../common widgets/alert.dart';
import '../../router/routes_const.dart';
import '../services/navigation_service.dart';
import '../services/storage_services.dart';
import '../services/snack_bar_service.dart';

class AuthProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  User? user;
  final List<String> items = ['970', '972'];

  String selectedItem = '970';

  bool isloading = false;
  bool isAgree = false;
  bool saveUser = false;

  void changeSelectedItem(dynamic value) {
    selectedItem = value;
    notifyListeners();
  }

  void agreeWithTrams(bool value) {
    isAgree = value;
    notifyListeners();
  }

  void rememberUser(bool value) {
    saveUser = value;
    notifyListeners();
  }

  //--------------------------------    SIGN UP      -------------------------------------------

  void signUp(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate() && isAgree == true) {
      isloading = true;
      notifyListeners();
      final signupResponse = await locator<ApiServices>().signUp(
        email: emailController.text,
        phone: '$selectedItem${phoneController.text}',
        fullName: nameController.text,
        password: passwordController.text,
      );

      if (signupResponse.status == true) {
        isloading = false;

        locator<SnackBarSrevie>().showSnackBar(signupResponse.message!);
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        locator<NavigationService>()
            .pushNamed(routeName: RouteConstants.otpRoute);
      } else {
        isloading = false;

        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: signupResponse.message!),
        );
      }
      notifyListeners();
    }
  }

  //--------------------------------    LOGIN     -------------------------------------------

  login(GlobalKey<FormState> loginKey) async {
    if (loginKey.currentState!.validate()) {
      locator<SpService>().writeBool('isLoggedIn', saveUser);
      isloading = true;
      notifyListeners();
      APIResponse loginResponse = await locator<ApiServices>().login(
          email: emailController.text, password: passwordController.text);

      if (loginResponse.status == true) {
        locator<SpService>().saveToken(loginResponse.data!.token!);
        user = loginResponse.data;
        isloading = false;
        emailController.clear();
        passwordController.clear();
        locator<NavigationService>()
            .pushReplacementNamed(RouteConstants.mainRoute);
      } else {
        isloading = false;
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: loginResponse.message!),
        );
      }
    }
  }

  //--------------------------------    LOGOUT     -------------------------------------------
  logout() async {
    final logoutResponse = await locator<ApiServices>().logout();
    saveUser = false;
    notifyListeners();
    if (logoutResponse.status == true) {
      locator<SnackBarSrevie>().showSnackBar(logoutResponse.message!);
      locator<NavigationService>()
          .pushNamed(routeName: RouteConstants.loginRoute);
    } else {
      showDialog(
        context: locator<NavigationService>().navigatorKey.currentContext!,
        builder: (_) => CustomAlert(message: logoutResponse.message!),
      );
    }
  }
}
