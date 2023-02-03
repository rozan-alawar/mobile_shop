import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/utils/locator.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/error2.json'),
          Text(message),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => locator<NavigationService>().pop(),
          child: const Text('OK'),
        )
      ],
    );
  }
}
