import 'package:e_commerce/core/domain/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_footer.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                    tag: 'product_image_${product.id}',
                    child: Image.network(product.coverPictureUrl),
                  ),
                  AppText(
                    text: product.categories.first,
                    textColor: AppColors.grey,
                  ),
                  AppText(
                    text: product.name,
                    textWeight: FontWeight.bold,
                    textSize: 30,
                    maxLineText: 3,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      AppText(text: product.rating.toString()),
                      const SizedBox(width: 8),
                      reviewsCount(product.reviewsCount),
                      const SizedBox(width: 16),
                      AppText(text: '|'),
                      const SizedBox(width: 16),
                      isInStock(product.stock),
                    ],
                  ),
                  const SizedBox(height: 16),

                  storyWidget(product.description),
                  const SizedBox(height: 16),
                  productPrice(product.price),
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
            CustomButton(text: "Add to Cart", onPressed: () {}),
            AppFooter(),
          ],
        ),
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
