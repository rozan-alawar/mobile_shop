import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/services/navigation_service.dart';
import '../utils/locator.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title, this.action = const []});
  final String title;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => locator<NavigationService>().pop(),
        child: SvgPicture.asset(
          'assets/icons/Iconly/Light/Arrow - Left 2.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        title,
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
