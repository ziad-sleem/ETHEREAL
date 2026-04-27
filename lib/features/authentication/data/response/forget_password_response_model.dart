import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  final String message;
 

  ForgetPasswordResponseModel({
    required this.message,
   
  });
  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);
}
