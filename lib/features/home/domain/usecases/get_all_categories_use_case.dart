import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final HomeRepo homeRepo;

  GetAllCategoriesUseCase(this.homeRepo);

  Future<BaseResponse<List<CategoryEntity>>> call() async {
    return await homeRepo.getCategories();
  }
}
