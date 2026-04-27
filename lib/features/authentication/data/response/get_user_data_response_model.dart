import 'package:json_annotation/json_annotation.dart';

part 'get_user_data_response_model.g.dart';

@JsonSerializable()
class GetUserDataResponseModel {
  final String fullName;
  final String email;

  GetUserDataResponseModel({
    required this.fullName,
    required this.email,
  });
  factory GetUserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataResponseModelFromJson(json);
}
