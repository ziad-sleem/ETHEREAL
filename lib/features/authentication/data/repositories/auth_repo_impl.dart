import 'package:e_commerce/features/authentication/data/datasources/auth_local_data_source_contract.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_remote_data_source_contract.dart';
import 'package:e_commerce/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/error_handler/error_handler.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSourceContract authRemoteDataSourceContract;
  final AuthLocalDataSourceContract authLocalDataSourceContract;

  AuthRepoImpl({
    required this.authRemoteDataSourceContract,
    required this.authLocalDataSourceContract,
  });

  @override
  Future<BaseResponse<String>> login({
    required String email,
    required String password,
  }) async {
    final response = await authRemoteDataSourceContract.login(
      email: email,
      password: password,
    );

    switch (response) {
      case SuccessBaseResponse<String>():
        return SuccessBaseResponse<String>(response.data);
      case ErrorBaseResponse<String>():
        return ErrorBaseResponse<String>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await authRemoteDataSourceContract.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    switch (response) {
      case SuccessBaseResponse<String>():
        return SuccessBaseResponse<String>(response.data);
      case ErrorBaseResponse<String>():
        return ErrorBaseResponse<String>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<void>> logout() async {
    try {
      await authRemoteDataSourceContract.logout();
      await authLocalDataSourceContract.deleteToken();
      await authLocalDataSourceContract.deleteRefreshToken();
      return SuccessBaseResponse<void>(null);
    } catch (e) {
      return ErrorBaseResponse<void>(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<UserEntity>> getUserData() async {
    final response = await authRemoteDataSourceContract.getUserData();

    switch (response) {
      case SuccessBaseResponse<UserModel>():
        return SuccessBaseResponse<UserEntity>(response.data.toEntity());
      case ErrorBaseResponse<UserModel>():
        return ErrorBaseResponse<UserEntity>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<String>> forgetPassword(String email) async {
    final response = await authRemoteDataSourceContract.forgetPassword(email);

    switch (response) {
      case SuccessBaseResponse<String>():
        return SuccessBaseResponse<String>(response.data);
      case ErrorBaseResponse<String>():
        return ErrorBaseResponse<String>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<String>> verifyCode({required String email, required String otp}) async {
      final response = await authRemoteDataSourceContract.verifyResetCode(email, otp);


    switch (response) {
      case SuccessBaseResponse<String>():
        return SuccessBaseResponse<String>(response.data);
      case ErrorBaseResponse<String>():
        return ErrorBaseResponse<String>(response.errorMessage);
    }

  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await authLocalDataSourceContract.getToken();
    return token != null && token.isNotEmpty;
  }
}
