import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/end_points.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_client.g.dart';

@injectable
@RestApi()
abstract class CartApiClient {
  @factoryMethod
  factory CartApiClient(Dio dio) = _CartApiClient;

  @POST(EndPoints.cartItems)
  Future<AddToCartResponseModel> addToCart(@Body() Map<String, dynamic> body);

  @GET(EndPoints.cart)
  Future<CartModel> getCart();

  @DELETE(EndPoints.deleteCartItem)
  Future<dynamic> deleteFromCart(@Path("id") String id, @Body() Map<String, dynamic> body);
}
