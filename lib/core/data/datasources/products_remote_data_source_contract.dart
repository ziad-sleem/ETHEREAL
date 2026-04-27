import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/core/data/models/pagination_model.dart';
import 'package:e_commerce/core/data/models/product_model.dart';

abstract class ProductsRemoteDataSourceContract {
  Future<BaseResponse<PaginationModel<ProductModel>>> getProducts(int page, int pageSize);
}
