import 'package:e_commerce/core/utils/app_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _secureStorage.write(key: AppKeys.tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: AppKeys.tokenKey);
  }

  static Future<void> deleteToken() async {
    await _secureStorage.delete(key: AppKeys.tokenKey);
  }

  static Future<void> saveRememberMe(bool value) async {
    await _secureStorage.write(
      key: AppKeys.rememberMeKey,
      value: value.toString(),
    );
  }

  static Future<bool> getRememberMe() async {
    String? value = await _secureStorage.read(key: AppKeys.rememberMeKey);
    return value == 'true';
  }

  static Future<void> writeData({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> readData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> deleteData({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }
}
