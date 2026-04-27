import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSourceContract {
  Future<BaseResponse<String>> login({
    required String email,
    required String password,
  });
  Future<BaseResponse<String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,

  });

  Future<void> logout();
  Future<BaseResponse<UserModel>> getUserData();
  Future<BaseResponse<String>> forgetPassword(String email);
  Future<BaseResponse<String>> verifyResetCode(String email, String otp);
}
