// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseModel _$AddToCartResponseModelFromJson(
  Map<String, dynamic> json,
) => AddToCartResponseModel(
  message: json['message'] as String,
  id: json['id'] as String,
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$AddToCartResponseModelToJson(
  AddToCartResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'id': instance.id,
  'productId': instance.productId,
  'quantity': instance.quantity,
};
