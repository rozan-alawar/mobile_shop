import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/src/core/providers/page_provider.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/screens/home/explore/explore_screen.dart';
import 'package:mobile_shop/src/screens/home/favorite/favorite_screen.dart';
import 'package:mobile_shop/src/screens/home/home/home_screen.dart';
import 'package:mobile_shop/src/screens/home/profile/profile_screen.dart';
import 'package:mobile_shop/src/screens/home/cart/shoping_cart_screen.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';
import '../../common widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen(),
    const ShopingCartScreen(),
    const ExploreScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  final List<AppBar> appBar = [
    AppBar(
      backgroundColor: Colors.transparent,
      leading: Row(
        children: [
          Spaces.widthSpace(25),
          GestureDetector(
              onTap: () => locator<NavigationService>()
                  .pushNamed(routeName: RouteConstants.categoriesRoute),
              child: SvgPicture.asset(
                'assets/icons/Iconly/Bold/Category.svg',
                fit: BoxFit.scaleDown,
              )),
        ],
      ),
      title: const Text(
        'Home',
      ),
      actions: [
        GestureDetector(
            onTap: () => locator<NavigationService>()
                .pushNamed(routeName: RouteConstants.searchRoute),
            child: SvgPicture.asset('assets/icons/Iconly/Light/Search.svg')),
        Spaces.widthSpace(AppSize.s10),
        GestureDetector(
            onTap: () => locator<NavigationService>()
                .pushNamed(routeName: RouteConstants.notificationRoute),
            child:
                SvgPicture.asset('assets/icons/Iconly/Light/Notification.svg')),
        Spaces.widthSpace(AppSize.s24),
      ],
    ),
    AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Shopping Cart',
      ),
      actions: [
        SvgPicture.asset('assets/icons/Iconly/Light/Menu.svg'),
        Spaces.widthSpace(AppSize.s24),
      ],
    ),
    AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Explore',
      ),
      actions: [
        SvgPicture.asset('assets/icons/Iconly/Light/Notification.svg'),
        Spaces.widthSpace(AppSize.s24),
      ],
    ),
    AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'favorite',
      ),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Profile',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: appBar[provider.currentPage],
        extendBody: true,
        body: screens[provider.currentPage],
        bottomNavigationBar: BottomNavBar(provider: provider),
      ),
    );
  }
}
