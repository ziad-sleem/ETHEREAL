import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
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
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        child: AppLogo(),
      ),

      // divider
      dividerTheme: DividerThemeData(color: AppColors.lightGrey, thickness: 1),

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

      // text field
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontFamily: 'Podkova',
          fontSize: 18,
          color: AppColors.primary,
        ),
        
        errorStyle: const TextStyle(color: AppColors.error),
        border: _border(AppColors.grey),
        enabledBorder: _border(AppColors.grey),
        focusedBorder: _border(AppColors.primary, 2),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error, 2),
      ),
    );
  }
}

UnderlineInputBorder _border(Color color, [double width = 1]) =>
    UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
    );
