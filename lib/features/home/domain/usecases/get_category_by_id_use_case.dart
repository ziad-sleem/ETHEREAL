import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryByIdUseCase {
  final HomeRepo homeRepo;

  GetCategoryByIdUseCase(this.homeRepo);

  Future<BaseResponse<CategoryEntity>> call({required String id}) async {
    return await homeRepo.getCategoryById(id);
  }
}
