import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_model.g.dart';

@JsonSerializable()
class AddToCartResponseModel {
  final String message;
  final String id;
  final String productId;
  final int quantity;

  AddToCartResponseModel({
    required this.message,
    required this.id,
    required this.productId,
    required this.quantity,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseModelToJson(this);
}
