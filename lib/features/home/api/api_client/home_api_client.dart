import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/end_points.dart';
import 'package:e_commerce/features/home/data/response/get_all_categories_response_model.dart';
import 'package:e_commerce/features/home/data/response/get_all_products_response_model.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:e_commerce/features/home/api/models/get_products_request_body.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET("products")
  Future<GetAllProductsResponseModel> getProducts(
    @Body() GetProductsRequestBody body,
  );

  @GET(EndPoints.categories)
  Future<GetAllCategoriesResponseModel> getCategories();

  @GET(EndPoints.categoryById)
  Future<CategoryModel> getCategoryById(@Path("id") String id);
}
