import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryWithProducts extends Equatable {
  final CategoryEntity category;
  final List<ProductEntity> products;

  const CategoryWithProducts({
    required this.category,
    required this.products,
  });

  @override
  List<Object?> get props => [category, products];
}
