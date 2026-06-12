import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cart_entity.dart';
import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String cartId;
  final List<CartItemModel> cartItems;

  CartModel({
    required this.cartId,
    required this.cartItems,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  CartEntity toEntity() {
    return CartEntity(
      cartId: cartId,
      cartItems: cartItems.map((e) => e.toEntity()).toList(),
    );
  }
}
