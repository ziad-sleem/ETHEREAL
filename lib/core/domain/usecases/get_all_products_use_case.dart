import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/core/domain/entities/pagination_entity.dart';
import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/core/domain/repos/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final ProductsRepo productsRepo;

  GetAllProductsUseCase(this.productsRepo);

  Future<BaseResponse<PaginationEntity<ProductEntity>>> call(int page, int pageSize) async {
    return await productsRepo.getProducts(page, pageSize);
  }
}
