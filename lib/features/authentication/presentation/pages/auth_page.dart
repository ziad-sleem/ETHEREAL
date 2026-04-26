import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/features/main%20page/main_page.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/pages/login_page.dart';
import 'package:e_commerce/features/authentication/presentation/pages/otp_page.dart';
import 'package:e_commerce/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially, show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.loginState.data != null &&
              state.loginState.data!.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          } else if (state.loginState.errorMessage != null &&
              state.loginState.errorMessage!.isNotEmpty) {
            CustomSnackBar.error(context, state.loginState.errorMessage!);
          }
        },
        builder: (context, state) {
          return LoginPage(togglePages: togglePages);
        },
      );
    } else {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.registerState.data != null &&
              state.registerState.data!.isNotEmpty) {
            final registerEmail = state.registerEmail;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(email: registerEmail!),
              ),
            );
          } else if (state.registerState.errorMessage != null &&
              state.registerState.errorMessage!.isNotEmpty) {
            CustomSnackBar.error(context, state.registerState.errorMessage!);
          }
        },
        builder: (context, state) {
          return RegisterPage(togglePages: togglePages);
        },
      );
    }
  }
}
