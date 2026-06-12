import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cart_item_entity.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final String itemId;
  final String productId;
  final String productName;
  final String productCoverUrl;
  final int productStock;
  final double weightInGrams;
  final int quantity;
  final int discountPercentage;
  final double basePricePerUnit;
  final double finalPricePerUnit;
  final double totalPrice;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productCoverUrl,
    required this.productStock,
    required this.weightInGrams,
    required this.quantity,
    required this.discountPercentage,
    required this.basePricePerUnit,
    required this.finalPricePerUnit,
    required this.totalPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemEntity toEntity() {
    return CartItemEntity(
      itemId: itemId,
      productId: productId,
      productName: productName,
      productCoverUrl: productCoverUrl,
      productStock: productStock,
      weightInGrams: weightInGrams,
      quantity: quantity,
      discountPercentage: discountPercentage,
      basePricePerUnit: basePricePerUnit,
      finalPricePerUnit: finalPricePerUnit,
      totalPrice: totalPrice,
    );
  }
}
