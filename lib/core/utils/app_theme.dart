import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      useMaterial3: true,

      // app bar  theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),


      // divider
      dividerTheme: DividerThemeData(
        color: AppColors.grey,
        thickness: 2,
      ),

      // color scheme
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.lightGrey,
        secondary: AppColors.secondary,
        onSecondary: AppColors.grey,
        error: AppColors.error,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.secondary,
      ),
    );
  }
}
