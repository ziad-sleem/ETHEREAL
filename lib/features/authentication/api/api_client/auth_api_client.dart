import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/end_points.dart';
import 'package:e_commerce/features/authentication/data/response/get_user_data_response_model.dart';
import 'package:e_commerce/features/authentication/data/response/login_response_model.dart';
import 'package:e_commerce/features/authentication/data/response/register_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(EndPoints.login)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);

  @POST(EndPoints.register)
  Future<RegisterResponseModel> register(@Body() Map<String, dynamic> body);

  @POST(EndPoints.logout)
  Future<void> logout();

  @GET(EndPoints.profileData)
  Future<GetUserDataResponseModel> getUserData();

  @POST(EndPoints.forgetPassword)
  Future<String> forgetPassword(@Body() Map<String, dynamic> body);

  @POST(EndPoints.verifyOTP)
  Future<String> verifyResetCode(@Body() Map<String, dynamic> body);
}
