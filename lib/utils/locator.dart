import 'package:get_it/get_it.dart';
import 'package:mobile_shop/core/services/navigation_service.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
