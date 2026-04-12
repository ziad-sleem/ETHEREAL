import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle logoStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle authWelcomStyle = TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}
