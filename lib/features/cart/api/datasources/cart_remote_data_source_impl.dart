import 'package:dio/dio.dart';
import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/features/cart/data/datasources/cart_remote_data_source_contract.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/api/api_client/cart_api_client.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSourceContract)
class CartRemoteDataSourceImpl implements CartRemoteDataSourceContract {
  final CartApiClient _apiClient;

  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<AddToCartResponseModel>> addToCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      final response = await _apiClient.addToCart({
        'productId': productId,
        'quantity': quantity,
      });
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<CartModel>> getCart() async {
    try {
      final response = await _apiClient.getCart();
      return SuccessBaseResponse(response);
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<String>> deleteFromCart(String id) async {
    try {
      await _apiClient.deleteFromCart(id, {'id': id});
      return SuccessBaseResponse("Item deleted successfully");
    } catch (e) {
      return ErrorBaseResponse(ErrorHandler.handle(e));
    }
  }
}
