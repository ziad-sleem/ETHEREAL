import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class SelectedForYouWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const SelectedForYouWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: "SELECTED FOR YOU",
          textAlign: TextAlign.center,
          textSize: 30,
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: AppText(
            text: "Personalized recommendations for a curated life.",
            textAlign: TextAlign.center,
            textSize: 15,
            maxLineText: 3,
            textColor: AppColors.grey,
          ),
        ),
        const SizedBox(height: 25),

        SizedBox(
          height: 350,
          child: ListView.separated(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => SizedBox(
              width: 180,
              child: ProductWidget(product: products[index]),
            ),
          ),
        ),
      ],
    );
  }
}
