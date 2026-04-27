import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/models/pagination_model.dart';
import 'package:e_commerce/core/data/models/product_model.dart';
import 'package:e_commerce/core/api/models/get_products_request_body.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api_client.g.dart';

@injectable
@RestApi()
abstract class ProductsApiClient {
  @factoryMethod
  factory ProductsApiClient(Dio dio) = _ProductsApiClient;

  @GET("products")
  Future<PaginationModel<ProductModel>> getProducts(
    @Body() GetProductsRequestBody body,
  );
}
