import 'package:flutter/material.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';

class SnackBarSrevie {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  showSnackBar(String content) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorManager.primary,
        content: Text(content),
      ),
    );
  }
}
