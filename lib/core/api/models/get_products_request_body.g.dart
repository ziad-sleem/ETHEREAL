// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsRequestBody _$GetProductsRequestBodyFromJson(
  Map<String, dynamic> json,
) => GetProductsRequestBody(
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
);

Map<String, dynamic> _$GetProductsRequestBodyToJson(
  GetProductsRequestBody instance,
) => <String, dynamic>{'page': instance.page, 'pageSize': instance.pageSize};
