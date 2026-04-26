import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductDetailsPage(product: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: 'product_image_${product.id}',
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  // Minimal rounded corners if desired, or let it be sharp as in image.
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.coverPictureUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          AppText(
            text: product.categories.isNotEmpty
                ? product.categories.first.toUpperCase()
                : 'ETHEREAL',
            textColor: Colors.grey.shade600,
            textWeight: FontWeight.w500,
            textSize: 10,
          ),
          SizedBox(height: 4),
          AppText(text: product.name, maxLineText: 1, textSize: 14),
          SizedBox(height: 4),
          AppText(
            text: '\$${product.price.toStringAsFixed(0)}',
            textColor: Color(0xFF8C6D34), // A gold/brown matching the image
            textWeight: FontWeight.bold,
            textSize: 12,
          ),
        ],
      ),
    );
  }
}
