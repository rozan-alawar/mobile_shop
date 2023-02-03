import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';

class LoadingIndiaor extends StatelessWidget {
  const LoadingIndiaor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SpinKitThreeBounce(
        color: ColorManager.primary,
        size: 25.0,
      ),
    );
  }
}
