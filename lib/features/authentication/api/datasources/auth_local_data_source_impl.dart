import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasources/auth_local_data_source_contract.dart';

@Injectable(as: AuthLocalDataSourceContract)
class AuthLocalDataSourceImpl implements AuthLocalDataSourceContract {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl(this.secureStorage);

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresAtKey = 'expires_at';

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await secureStorage.delete(key: _refreshTokenKey);
  }

  @override
  Future<String> getRefreshToken() async {
    final refreshToken = await secureStorage.read(key: _refreshTokenKey);
    return refreshToken ?? '';
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await secureStorage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<void> saveExpirationDate(String expiresAt) async {
    await secureStorage.write(key: _expiresAtKey, value: expiresAt);
  }

  @override
  Future<String?> getExpirationDate() async {
    return await secureStorage.read(key: _expiresAtKey);
  }
}
