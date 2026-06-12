import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_cached_image.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: AppCachedImage(
              imageUrl: cartItem.productCoverUrl,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText(
                        text: cartItem.productName,
                        textWeight: FontWeight.bold,
                        maxLineText: 3,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().deleteFromCart(
                          cartItem.itemId,
                        );
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
                AppText(
                  text: "${cartItem.finalPricePerUnit}",
                  textColor: AppColors.grey,
                ),
                AppText(
                  text: "Qty: ${cartItem.quantity}",
                  textWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
