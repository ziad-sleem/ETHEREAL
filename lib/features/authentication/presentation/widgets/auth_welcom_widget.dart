import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AuthWelcomWidget extends StatelessWidget {
  final bool isLogin;
  const AuthWelcomWidget({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          AppText(
            text: "WELCOME",
            textSize: 60,
            textAlign: TextAlign.center,
            textWeight: FontWeight.bold,
            maxLineText: 2,
          ),
          AppText(
            text: isLogin ? "Back" : "Join",
            textAlign: TextAlign.center,
            textSize: 60,
            textWeight: FontWeight.bold,
            maxLineText: 2,
          ),
          AppText(
            textAlign: TextAlign.center,
            text: isLogin
                ? "Enter your details to access your atelier."
                : "Join our atelier for a curated experience.",
          ),
        ],
      ),
    );
  }
}
