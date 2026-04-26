import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<BaseResponse<List<ProductEntity>>> getProducts(int page, int pageSize);
  Future<BaseResponse<List<CategoryEntity>>> getCategories();
  Future<BaseResponse<CategoryEntity>> getCategoryById(String id);
}
