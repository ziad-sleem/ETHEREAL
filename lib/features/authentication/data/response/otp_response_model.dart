import 'package:json_annotation/json_annotation.dart';

part 'otp_response_model.g.dart';

@JsonSerializable()
class OTPResponseModel {
  final String message;
 

  OTPResponseModel({
    required this.message,
   
  });
  factory OTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseModelFromJson(json);
}
