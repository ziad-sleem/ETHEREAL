import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepo homeRepo;

  GetAllProductsUseCase(this.homeRepo);

  Future<BaseResponse<List<ProductEntity>>> call(int page, int pageSize) async {
    return await homeRepo.getProducts(page, pageSize);
  }
}
