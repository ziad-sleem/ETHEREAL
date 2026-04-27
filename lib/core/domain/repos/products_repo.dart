import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/core/domain/entities/pagination_entity.dart';
import 'package:e_commerce/core/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<BaseResponse<PaginationEntity<ProductEntity>>> getProducts(int page, int pageSize);
}
