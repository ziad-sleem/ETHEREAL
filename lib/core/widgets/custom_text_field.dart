import 'package:e_commerce/config/validations/app_validations.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FieldType fieldType;
  final VoidCallback? onSuffixPressed;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.fieldType,
    this.onSuffixPressed,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  bool get _isPasswordField => widget.fieldType == FieldType.password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return TextFormField(
      autocorrect: true,
      controller: widget.controller,
      keyboardType: widget.fieldType.textInputType,
      validator: _validate,

      textInputAction: TextInputAction.next,
      style: TextStyle(
        fontFamily: 'Podkova',
        fontSize: 18,
        color: theme.primary,
      ),
      obscureText: _isPasswordField && _isObscured,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.fieldType.hint,
        hintStyle: TextStyle(
          fontFamily: 'Podkova',
          fontSize: 18,
          color: theme.primary,
        ),
        suffixIcon: _isPasswordField
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: theme.onSecondary,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
        errorStyle: const TextStyle(color: AppColors.error),
        border: _border(theme.onSecondary),
        enabledBorder: _border(theme.onSecondary),
        focusedBorder: _border(Theme.of(context).colorScheme.primary, 2),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error, 2),
      ),
    );
  }

  UnderlineInputBorder _border(Color color, [double width = 1]) =>
      UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
      );

  String? _validate(String? value) {
    switch (widget.fieldType) {
      case FieldType.email:
        return AppValidations.validateEmail(value);
      case FieldType.password:
        return AppValidations.validatePassword(value);
      case FieldType.firstName:
        return AppValidations.validateFirstName(value);
      case FieldType.lastName:
        return AppValidations.validateLastName(value);
      case FieldType.none:
        return null;
    }
  }
}

enum FieldType {
  email(
    AppStrings.email,
    AppStrings.enterYourEmail,
    TextInputType.emailAddress,
  ),
  password(
    AppStrings.password,
    AppStrings.enterYourPassword,
    TextInputType.text,
  ),
  firstName(
    AppStrings.firstName,
    AppStrings.enterFirstName,
    TextInputType.name,
  ),
  lastName(AppStrings.lastName, AppStrings.enterLastName, TextInputType.name),
  none('', '', TextInputType.text);

  final String label;
  final String hint;
  final TextInputType textInputType;
  const FieldType(this.label, this.hint, this.textInputType);
}
