

import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepo {
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

  Future<BaseResponse<void>> logout();
  Future<BaseResponse<UserEntity>> getUserData();
  Future<BaseResponse<String>> forgetPassword(String email);
  Future<BaseResponse<String>> verifyCode({required String email, required String otp});
  Future<bool> isLoggedIn();
}
