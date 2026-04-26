import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: (isEnabled && !isLoading) ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child:  CircularProgressIndicator(
                    color: theme.primary,
                    strokeWidth: 2,
                  ),
                )
              : AppText(
                  text: text,
                  textColor: theme.secondary,
                  textWeight: FontWeight.bold,
                  textSize: 20,
                ),
        ),
      ),
    );
  }
}
