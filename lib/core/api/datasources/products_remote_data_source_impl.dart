import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/core/api/api_client/products_api_client.dart';
import 'package:e_commerce/core/api/models/get_products_request_body.dart';
import 'package:e_commerce/core/data/datasources/products_remote_data_source_contract.dart';
import 'package:e_commerce/core/data/models/pagination_model.dart';
import 'package:e_commerce/core/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSourceContract)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSourceContract {
  final ProductsApiClient productsApiClient;

  ProductsRemoteDataSourceImpl({required this.productsApiClient});

  @override
  Future<BaseResponse<PaginationModel<ProductModel>>> getProducts(
    int page,
    int pageSize,
  ) async {
    try {
      final requestBody = GetProductsRequestBody(
        page: page,
        pageSize: pageSize,
      );
      final response = await productsApiClient.getProducts(requestBody);

      return SuccessBaseResponse<PaginationModel<ProductModel>>(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }
}
