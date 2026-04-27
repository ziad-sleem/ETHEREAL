import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T> {
  @JsonKey(name: 'items')
  final List<T> items;
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

  PaginationModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginationModelToJson(this, toJsonT);
}
