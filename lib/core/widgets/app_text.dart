import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final int maxLineText;
  final TextAlign textAlign;
  final double spacing;
  const AppText({
    super.key,
    required this.text,
    this.textSize = 16,
    this.textWeight = FontWeight.normal,
    this.textColor = AppColors.black,
    this.maxLineText = 1,
    this.spacing = 1,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLineText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Podkova',
        fontSize: textSize,
        fontWeight: textWeight,
        overflow: TextOverflow.ellipsis,
        letterSpacing: spacing,
      ),
    );
  }
}
