import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';

abstract class HomeRepo {
  Future<BaseResponse<List<CategoryEntity>>> getCategories();
  Future<BaseResponse<CategoryEntity>> getCategoryById(String id);
}
