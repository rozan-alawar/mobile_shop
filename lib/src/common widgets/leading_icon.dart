import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/utils/locator.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        locator<NavigationService>().pop();
      },
      icon: SvgPicture.asset(
        'assets/icons/Iconly/Light/Arrow - Left 2.svg',
      ),
    );
  }
}
