import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/data/response/add_to_cart_response_model.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final CartRepo cartRepo;

  AddToCartUseCase({required this.cartRepo});

  Future<BaseResponse<AddToCartResponseModel>> call({
    required String productId,
    required int quantity,
  }) async {
    return await cartRepo.addToCart(productId: productId, quantity: quantity);
  }
}
