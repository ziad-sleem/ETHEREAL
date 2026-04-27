import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSourceContract homeRemoteDataSourceContract;

  HomeRepoImpl({required this.homeRemoteDataSourceContract});

  @override
  Future<BaseResponse<List<CategoryEntity>>> getCategories() async {
    final response = await homeRemoteDataSourceContract.getCategories();

    switch (response) {
      case SuccessBaseResponse<List<CategoryModel>>():
        return SuccessBaseResponse<List<CategoryEntity>>(
          response.data.map((c) => c.toEntity()).toList(),
        );
      case ErrorBaseResponse<List<CategoryModel>>():
        return ErrorBaseResponse<List<CategoryEntity>>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<CategoryEntity>> getCategoryById(String id) async {
    final response = await homeRemoteDataSourceContract.getCategoryById(id);

    switch (response) {
      case SuccessBaseResponse<CategoryModel>():
        return SuccessBaseResponse<CategoryEntity>(response.data.toEntity());
      case ErrorBaseResponse<CategoryModel>():
        return ErrorBaseResponse<CategoryEntity>(response.errorMessage);
    }
  }
}
