import 'package:json_annotation/json_annotation.dart';

part 'get_products_request_body.g.dart';

@JsonSerializable()
class GetProductsRequestBody {
  final int page;
  final int pageSize;

  GetProductsRequestBody({
    required this.page,
    required this.pageSize,
  });

  factory GetProductsRequestBody.fromJson(Map<String, dynamic> json) => _$GetProductsRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsRequestBodyToJson(this);
}
