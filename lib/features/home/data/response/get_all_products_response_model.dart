import 'package:json_annotation/json_annotation.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/domain/entities/paginated_products_entity.dart';

part 'get_all_products_response_model.g.dart';

@JsonSerializable()
class GetAllProductsResponseModel {
  @JsonKey(name: 'items')
  final List<ProductModel> items;
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'pageSize')
  final int pageSize;
  @JsonKey(name: 'totalCount')
  final int totalCount;
  @JsonKey(name: 'hasNextPage')
  final bool hasNextPage;
  @JsonKey(name: 'hasPreviousPage')
  final bool hasPreviousPage;

  GetAllProductsResponseModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory GetAllProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsResponseModelToJson(this);

  PaginatedProductsEntity toEntity() => PaginatedProductsEntity(
    items: items.map((e) => e.toEntity()).toList(),
    page: page,
    pageSize: pageSize,
    totalCount: totalCount,
    hasNextPage: hasNextPage,
    hasPreviousPage: hasPreviousPage,
  );
}
