import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/delete_from_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;

  CartCubit({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.deleteFromCartUseCase,
  }) : super(CartInitial());

  Future<void> addToCart(String productId, int quantity) async {
    emit(CartLoading());
    final response = await addToCartUseCase(productId: productId, quantity: quantity);
    switch (response) {
      case SuccessBaseResponse():
        emit(AddToCartSuccess(response.data.message));
      case ErrorBaseResponse():
        emit(AddToCartError(response.errorMessage));
    }
  }

  Future<void> getCart() async {
    emit(CartLoading());
    final response = await getCartUseCase();
    switch (response) {
      case SuccessBaseResponse():
        emit(GetCartSuccess(response.data));
      case ErrorBaseResponse():
        emit(GetCartError(response.errorMessage));
    }
  }

  Future<void> deleteFromCart(String id) async {
    emit(CartLoading());
    final response = await deleteFromCartUseCase(id);
    switch (response) {
      case SuccessBaseResponse():
        emit(DeleteFromCartSuccess(response.data));
      case ErrorBaseResponse():
        emit(DeleteFromCartError(response.errorMessage));
    }
  }
}
