import 'package:e_commerce/features/authentication/domain/entities/verify_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'verify_model.g.dart';

@JsonSerializable()
class VerifyModel {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  VerifyModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyModelToJson(this);

  VerifyEntity toEntity() {
    return VerifyEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAtUtc: expiresAtUtc,
    );
  }
}
