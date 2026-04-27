// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponseModel _$VerifyResponseModelFromJson(Map<String, dynamic> json) =>
    VerifyResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAtUtc: json['expiresAtUtc'] as String,
    );

Map<String, dynamic> _$VerifyResponseModelToJson(
  VerifyResponseModel instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'expiresAtUtc': instance.expiresAtUtc,
};
