import 'cart_item_entity.dart';

class CartEntity {
  final String cartId;
  final List<CartItemEntity> cartItems;

  const CartEntity({
    required this.cartId,
    required this.cartItems,
  });
}
