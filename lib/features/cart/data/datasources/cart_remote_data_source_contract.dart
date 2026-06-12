import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSourceContract {
  Future<BaseResponse<AddToCartResponseModel>> addToCart({
    required String productId,
    required int quantity,
  });

  Future<BaseResponse<CartModel>> getCart();

  Future<BaseResponse<String>> deleteFromCart(String id);
}
