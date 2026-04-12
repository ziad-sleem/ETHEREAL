import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLogin;
  final VoidCallback onPressed;
  const AuthAppBar({super.key, required this.isLogin, required this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          // logo
          AppLogo(),
          Spacer(),

          // toggle
          CustomTextButton(
            text: isLogin ? 'Create Account' : 'I have an account',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
