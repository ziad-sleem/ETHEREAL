import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/data/datasources/cart_remote_data_source_contract.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSourceContract cartRemoteDataSourceContract;

  CartRepoImpl({required this.cartRemoteDataSourceContract});

  @override
  Future<BaseResponse<AddToCartResponseModel>> addToCart({
    required String productId,
    required int quantity,
  }) async {
    final response = await cartRemoteDataSourceContract.addToCart(
      productId: productId,
      quantity: quantity,
    );

    switch (response) {
      case SuccessBaseResponse<AddToCartResponseModel> success:
        return SuccessBaseResponse<AddToCartResponseModel>(success.data);
      case ErrorBaseResponse<AddToCartResponseModel> error:
        return ErrorBaseResponse<AddToCartResponseModel>(error.errorMessage);
    }
  }

  @override
  Future<BaseResponse<CartEntity>> getCart() async {
    final response = await cartRemoteDataSourceContract.getCart();

    switch (response) {
      case SuccessBaseResponse<CartModel> success:
        return SuccessBaseResponse<CartEntity>(success.data.toEntity());
      case ErrorBaseResponse<CartModel> error:
        return ErrorBaseResponse<CartEntity>(error.errorMessage);
    }
  }

  @override
  Future<BaseResponse<String>> deleteFromCart(String id) async {
    final response = await cartRemoteDataSourceContract.deleteFromCart(id);

    switch (response) {
      case SuccessBaseResponse<String> success:
        return SuccessBaseResponse<String>(success.data);
      case ErrorBaseResponse<String> error:
        return ErrorBaseResponse<String>(error.errorMessage);
    }
  }
}
