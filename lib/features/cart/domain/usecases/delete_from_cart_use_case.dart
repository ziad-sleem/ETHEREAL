import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromCartUseCase {
  final CartRepo cartRepo;

  DeleteFromCartUseCase({required this.cartRepo});

  Future<BaseResponse<String>> call(String id) async {
    return await cartRepo.deleteFromCart(id);
  }
}
