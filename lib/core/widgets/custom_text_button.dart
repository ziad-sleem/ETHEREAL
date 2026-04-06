import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnable;
  final bool isLoading;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnable = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: isEnable && !isLoading ? onPressed : null,
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator.adaptive(),
              )
            : AppText(text: text, textColor: AppColors.primary),
      ),
    );
  }
}
