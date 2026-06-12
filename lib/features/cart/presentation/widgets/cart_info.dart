import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';

class CartInfo extends StatelessWidget {
  final CartEntity cart;
  const CartInfo({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    double totalAmount = 0;
    int totalItems = 0;

    for (var item in cart.cartItems) {
      subtotal += item.basePricePerUnit * item.quantity;
      totalAmount += item.totalPrice;
      totalItems += item.quantity;
    }

    double discount = subtotal - totalAmount;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildInfoRow('Total Items', "$totalItems", textColor: AppColors.grey),
          const SizedBox(height: 12),
          _buildInfoRow('Subtotal', "$subtotal", textColor: AppColors.grey),
          const SizedBox(height: 12),
          _buildInfoRow('Discount', "-$discount", textColor: AppColors.primary),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 12),
          _buildInfoRow(
            'Total Amount',
            "$totalAmount",
            textColor: AppColors.black,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    Color? textColor,
    bool isBold = false,
  }) {
    return Row(
      children: [
        AppText(
          text: label,
          textColor: textColor!,
          textWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        const Spacer(),
        AppText(
          text: value,
          textColor: textColor,
          textWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ],
    );
  }
}
