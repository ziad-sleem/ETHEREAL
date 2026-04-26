import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/auth_welcom_widget.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // login method
    void login() {
      // prepare email and password
      final String email = emailController.text;
      final String password = passwordController.text;

      // auth cubit
      final authCubit = context.read<AuthCubit>();

      // check if not empty
      if (email.isNotEmpty && password.isNotEmpty) {
        // login
        authCubit.login(email: email, password: password);
      }
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AuthAppBar(isLogin: true, onPressed: widget.togglePages!),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 40,
              ),
              child: Column(
                children: [
                  AuthWelcomWidget(isLogin: true),
                  SizedBox(height: size.height * 0.10),

                  // email
                  CustomTextField(
                    controller: emailController,
                    fieldType: FieldType.email,
                  ),

                  SizedBox(height: size.height * 0.03),

                  // password
                  CustomTextField(
                    controller: passwordController,
                    fieldType: FieldType.password,
                  ),

                  SizedBox(height: size.height * 0.01),

                  // forget password
                  ForgetPasswordWidget(emailController: emailController),

                  // // OR divider
                  // OrDivider(),

                  // // Google Sign-In button
                  // GoogleSigninButton(),
                  // SizedBox(height: size.height * 0.02),

                  // toggle page
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        isLoading: context.watch<AuthCubit>().state.loginState.isLoading,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, proceed to login
            login();
          }
        },
        text: "LOGIN",
      ),
    );
  }
}
