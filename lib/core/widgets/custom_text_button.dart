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
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      child: TextButton(
        onPressed: isEnable && !isLoading ? onPressed : null,
        child: isLoading
            ? AppText(text: "Loading...", textColor: theme.primary)
            : AppText(text: text, textColor: theme.primary),
      ),
    );
  }
}
