import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/features/home/api/api_client/home_api_client.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final HomeApiClient homeApiClient;

  HomeRemoteDataSourceImpl({required this.homeApiClient});

  @override
  Future<BaseResponse<List<CategoryModel>>> getCategories() async {
    try {
      final response = await homeApiClient.getCategories();
      return SuccessBaseResponse<List<CategoryModel>>(response.categories);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<CategoryModel>> getCategoryById(String id) async {
    try {
      final response = await homeApiClient.getCategoryById(id);
      return SuccessBaseResponse<CategoryModel>(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }
}
