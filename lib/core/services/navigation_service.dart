import 'package:flutter/cupertino.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  pushNamed(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  pushReplacementNamed(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  pop() {
    navigatorKey.currentState!.pop();
  }
}
