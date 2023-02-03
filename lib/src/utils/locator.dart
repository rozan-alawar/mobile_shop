import 'package:get_it/get_it.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/core/services/storage_services.dart';
import 'package:mobile_shop/src/core/services/snack_bar_service.dart';
import 'package:mobile_shop/src/data/api/api_service/api_services.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<ApiServices>(() => ApiServices());
  locator.registerLazySingleton<SnackBarSrevie>(() => SnackBarSrevie());
  locator.registerSingleton<SpService>(SpService());
}
