abstract class AuthLocalDataSourceContract {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();

  Future<void> saveRefreshToken(String token);
  Future<String> getRefreshToken();  
  Future<void> deleteRefreshToken();
  Future<void> saveExpirationDate(String expiresAt);
  Future<String?> getExpirationDate();
 
}
