// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyModel _$VerifyModelFromJson(Map<String, dynamic> json) => VerifyModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresAtUtc: json['expiresAtUtc'] as String,
);

Map<String, dynamic> _$VerifyModelToJson(VerifyModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresAtUtc': instance.expiresAtUtc,
    };
