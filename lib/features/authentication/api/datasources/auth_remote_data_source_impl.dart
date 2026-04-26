import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/features/authentication/api/api_client/auth_api_client.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_local_data_source_contract.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_remote_data_source_contract.dart';
import 'package:e_commerce/features/authentication/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  final AuthApiClient authApiClient;
  final AuthLocalDataSourceContract localDataSource;

  AuthRemoteDataSourceImpl({
    required this.authApiClient,
    required this.localDataSource,
  });

  @override
  Future<BaseResponse<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authApiClient.login({
        'email': email,
        'password': password,
      });

      final accessToken = response.accessToken;
      final refreshToken = response.refreshToken;
      final expiresAtUtc = response.expiresAtUtc;

      await localDataSource.saveToken(accessToken);
      await localDataSource.saveRefreshToken(refreshToken);
      await localDataSource.saveExpirationDate(expiresAtUtc);

      return SuccessBaseResponse<String>(accessToken);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,

  }) async {
    try {
      final response = await authApiClient.register({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,

      });

      final message = response.message;

      return SuccessBaseResponse<String>(message);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<void> logout() async {
    try {
      final token = await localDataSource.getToken();
      if (token != null) {
        try {
          await authApiClient.logout();
        } catch (_) {
          // Ignore API error during logout
        }
      }
    } finally {
      await Future.wait([localDataSource.deleteToken()]);
    }
  }

  @override
  Future<BaseResponse<UserModel>> getUserData() async {
    try {
      final response = await authApiClient.getUserData();

      final user = UserModel(username: response.fullName, email: response.email);

      return SuccessBaseResponse<UserModel>(user);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<String>> forgetPassword(String email) async {
    try {
      final response = await authApiClient.forgetPassword({"email": email});

      return SuccessBaseResponse<String>(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }


  @override
  Future<BaseResponse<String>> verifyResetCode(String email, String otp) async {
    try {
      final response = await authApiClient.verifyResetCode({"email": email, "otp": otp});
      return SuccessBaseResponse<String>(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }
}
