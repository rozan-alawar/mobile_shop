import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpService {
  SharedPreferences? instance;
  final secureStorage = const FlutterSecureStorage();

  SpService() {
    initSP();
  }

  int? appCounter;

  Future<int?> initSP() async {
    instance = await SharedPreferences.getInstance();
    appCounter = instance!.getInt('appCounter');
    if (appCounter == null) {
      appCounter = 1;
    } else {
      appCounter = appCounter! + 1;
    }

    instance!.setInt('appCounter', appCounter!);
    return appCounter;
  }

  writeString(String key, String value) async {
    await instance!.setString(key, value);
  }

  Future<String> readString(String key) async {
    return instance!.getString(key)!;
  }

  writeBool(String key, bool value) async {
    await instance!.setBool(key, value);
  }

  Future<bool> readBool(String key) async {
    return instance!.getBool(key)!;
  }

  saveToken(String value) async {
    await secureStorage.write(key: 'token', value: value);
  }

  Future<String?> getToken() async {
    String? token = await secureStorage.read(key: 'token');
    return token;
  }
}
