class CartItemEntity {
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

  const CartItemEntity({
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
}
