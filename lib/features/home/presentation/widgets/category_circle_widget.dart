import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCircleWidget extends StatelessWidget {
  final CategoryEntity category;
  final VoidCallback? onTap;

  const CategoryCircleWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightGrey,
                border: Border.all(color: Colors.transparent, width: 2),
              ),
              child: Center(
                child: category.coverPictureUrl != null
                    ? SvgPicture.network(
                        category.coverPictureUrl!,
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                        placeholderBuilder: (context) => _buildPlaceholder(),
                      )
                    : _buildPlaceholder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 80,
              child: AppText(
                text: category.name,
                textAlign: TextAlign.center,
                maxLineText: 2,
                textSize: 12,
                textWeight: FontWeight.bold,
                textColor: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey.withValues(alpha: 0.3),
      ),
      child: Center(
        child: Text(
          category.name.isNotEmpty ? category.name[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
