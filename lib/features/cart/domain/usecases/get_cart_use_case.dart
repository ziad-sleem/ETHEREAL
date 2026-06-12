import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  final CartRepo cartRepo;

  GetCartUseCase({required this.cartRepo});

  Future<BaseResponse<CartEntity>> call() async {
    return await cartRepo.getCart();
  }
}
