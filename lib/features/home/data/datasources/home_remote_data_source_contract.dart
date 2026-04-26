import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';

abstract class HomeRemoteDataSourceContract {
  Future<BaseResponse<List<ProductModel>>> getProducts(int page, int pageSize);
  Future<BaseResponse<List<CategoryModel>>> getCategories();
  Future<BaseResponse<CategoryModel>> getCategoryById(String id);
}
