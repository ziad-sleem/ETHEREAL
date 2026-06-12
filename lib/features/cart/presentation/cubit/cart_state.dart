part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final String message;
  const AddToCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AddToCartError extends CartState {
  final String errorMessage;
  const AddToCartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class GetCartSuccess extends CartState {
  final CartEntity cart;
  const GetCartSuccess(this.cart);

  @override
  List<Object> get props => [cart];
}

class GetCartError extends CartState {
  final String errorMessage;
  const GetCartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class DeleteFromCartSuccess extends CartState {
  final String message;
  const DeleteFromCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteFromCartError extends CartState {
  final String errorMessage;
  const DeleteFromCartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
