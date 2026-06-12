import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_footer.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_info.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is DeleteFromCartSuccess) {
          context.read<CartCubit>().getCart();
          CustomSnackBar.success(context, state.message);
        } else if (state is DeleteFromCartError) {
          CustomSnackBar.error(context, state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 28),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "My Cart",
                        textSize: 32,
                        textWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<CartCubit, CartState>(
                        buildWhen: (previous, current) =>
                            current is GetCartSuccess,
                        builder: (context, state) {
                          final count = (state is GetCartSuccess)
                              ? state.cart.cartItems.length
                              : 0;
                          return AppText(
                            text: '$count Items selected for your wardrobe',
                            textColor: AppColors.grey,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<CartCubit, CartState>(
                        buildWhen: (previous, current) =>
                            current is GetCartSuccess ||
                            current is GetCartError ||
                            current is CartLoading,
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is GetCartError) {
                            return Center(
                              child: AppText(text: state.errorMessage),
                            );
                          } else if (state is GetCartSuccess) {
                            final cartItems = state.cart.cartItems;
                            if (cartItems.isEmpty) {
                              return const Center(
                                child: AppText(text: "Your cart is empty"),
                              );
                            }
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                  cartItem: cartItems[index],
                                );
                              },
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<CartCubit, CartState>(
                        buildWhen: (previous, current) =>
                            current is GetCartSuccess ||
                            current is GetCartError ||
                            current is CartLoading,
                        builder: (context, state) {
                          if (state is GetCartSuccess) {
                            return CartInfo(cart: state.cart);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<CartCubit, CartState>(
                        buildWhen: (previous, current) =>
                            current is GetCartSuccess ||
                            current is GetCartError ||
                            current is CartLoading,
                        builder: (context, state) {
                          if (state is GetCartSuccess) {
                            final cartItems = state.cart.cartItems;
                            return CustomButton(
                              text: "Proceed To Checkout",
                              onPressed: cartItems.isEmpty ? null : () {},
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
