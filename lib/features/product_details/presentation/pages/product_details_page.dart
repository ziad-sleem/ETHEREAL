import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_footer.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartSuccess) {
            CustomSnackBar.success(context, state.message);
            Navigator.pop(context);
            context.read<CartCubit>().getCart();
          } else if (state is AddToCartError) {
            CustomSnackBar.error(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: AppLogo()),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Hero(
                          tag: 'product_image_${widget.product.id}',
                          child: Image.network(widget.product.coverPictureUrl),
                        ),
                        AppText(
                          text: widget.product.categories.first,
                          textColor: AppColors.grey,
                        ),
                        AppText(
                          text: widget.product.name,
                          textWeight: FontWeight.bold,
                          textSize: 30,
                          maxLineText: 3,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            AppText(text: widget.product.rating.toString()),
                            const SizedBox(width: 8),
                            reviewsCount(widget.product.reviewsCount),
                            const SizedBox(width: 16),
                            AppText(text: '|'),
                            const SizedBox(width: 16),
                            isInStock(widget.product.stock),
                          ],
                        ),
                        const SizedBox(height: 16),

                        storyWidget(widget.product.description),
                        const SizedBox(height: 16),
                        productPrice(widget.product.price),
                        const SizedBox(height: 16),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/images/AB6AXuDxI0NdOZNPYLMNddVXfroBtZdmHwYNA2GMXYmq3b7uR3JtowncarZ2N7WJxXxWYyJqTDmaFy7a34Wpm4dzeg1clk6tczV4Q3yYWVwDSCCsD27QBTskFcJikrdp-ksyOtmYD4anoaKq7POEjLjd3qcL8kdj4FHKCSclGT3L9v8bt8q6i.png',
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppText(
                          text: "Uncompromising Quality",
                          textWeight: FontWeight.bold,
                          textSize: 30,
                          maxLineText: 3,
                        ),
                        const SizedBox(height: 16),

                        AppText(
                          text:
                              'Every curve and every edge is\n meticulously polished by our master\n artisans. We believe that true luxury lies\n in the details that most will never see,\n but everyone will feel.',
                          maxLineText: 10,
                          textColor: AppColors.grey,
                        ),
                        const SizedBox(height: 25),

                        CustomTextButton(
                          text: 'Discover the Process',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ProductDetailsCubit>().decrement();
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      const SizedBox(width: 16),
                      BlocBuilder<ProductDetailsCubit, int>(
                        builder: (context, quantity) {
                          return AppText(
                            text: quantity.toString(),
                            textSize: 24,
                            textWeight: FontWeight.bold,
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          context.read<ProductDetailsCubit>().increment(
                            widget.product.stock,
                          );
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<ProductDetailsCubit, int>(
                    builder: (context, quantity) {
                      return CustomButton(
                        text: "Add to Cart",
                        isLoading: state is CartLoading,
                        onPressed: () {
                          context.read<CartCubit>().addToCart(
                            widget.product.id,
                            quantity,
                          );
                        },
                      );
                    },
                  ),
                  AppFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget isInStock(int stock) {
    return stock > 0
        ? AppText(text: "In Stock", textColor: AppColors.success)
        : AppText(text: "Out of Stock", textColor: AppColors.error);
  }

  Widget reviewsCount(int count) {
    return count > 0
        ? AppText(text: '(${count.toString()})')
        : AppText(text: "No reviews yet");
  }

  Widget storyWidget(String description) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: "The Story", textWeight: FontWeight.bold),
          const SizedBox(height: 8),

          AppText(
            text: description,
            maxLineText: 100,
            textColor: AppColors.grey,
          ),
        ],
      ),
    );
  }

  Widget productPrice(double price) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: 'Pricing'),
          AppText(
            text: '\$ $price',
            textWeight: FontWeight.bold,
            textSize: 50,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
