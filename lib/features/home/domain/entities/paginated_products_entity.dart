import 'package:equatable/equatable.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';

class PaginatedProductsEntity extends Equatable {
  final List<ProductEntity> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginatedProductsEntity({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  @override
  List<Object?> get props => [
        items,
        page,
        pageSize,
        totalCount,
        hasNextPage,
        hasPreviousPage,
      ];
}
