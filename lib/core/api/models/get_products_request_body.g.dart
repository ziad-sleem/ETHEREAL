// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsRequestBody _$GetProductsRequestBodyFromJson(
  Map<String, dynamic> json,
) => GetProductsRequestBody(
  isInStock: json['isInStock'] as bool? ?? true,
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
);

Map<String, dynamic> _$GetProductsRequestBodyToJson(
  GetProductsRequestBody instance,
) => <String, dynamic>{
  'isInStock': instance.isInStock,
  'page': instance.page,
  'pageSize': instance.pageSize,
};
