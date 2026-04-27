import 'package:json_annotation/json_annotation.dart';

part 'verify_response_model.g.dart';

@JsonSerializable()
class VerifyResponseModel {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  VerifyResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });
  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseModelFromJson(json);
}
