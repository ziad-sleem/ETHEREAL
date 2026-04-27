import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: "ETHEREAL",
      textSize: 20,
      textWeight: FontWeight.bold,
      spacing: 3,
    );
  }
}
