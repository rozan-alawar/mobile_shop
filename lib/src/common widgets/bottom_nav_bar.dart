import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../core/providers/page_provider.dart';
import '../utils/styles/color_manager.dart';
import '../utils/styles/values_manager.dart';

class BottomNavBar extends StatelessWidget {
  final PageProvider provider;
  const BottomNavBar({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 100,
      color: ColorManager.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: GNav(
            onTabChange: (value) => provider.changeCurrentPage(value),
            backgroundColor: ColorManager.white,
            hoverColor: ColorManager.lightPrimary,
            tabBorderRadius: 15,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            color: ColorManager.grey,
            activeColor: ColorManager.white,
            iconSize: 24,
            tabBackgroundColor: ColorManager.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p12,
            ),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
              ),
              GButton(
                icon: Icons.explore_outlined,
              ),
              GButton(
                icon: Icons.star_border_rounded,
              ),
              GButton(
                icon: Icons.person_outline,
              )
            ]),
      ),
    );
  }
}
