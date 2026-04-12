import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/auth_welcom_widget.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // register
    void register() {
      // prepare names and email and password
      final String firstName = firstNameController.text;
      final String lastName = lastNameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      final authCubit = context.read<AuthCubit>();

      // check if not empty
      if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        // register
        authCubit.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );
      }
      // fields are empty => display error
      else {
        CustomSnackBar.error(context, "Please complete all fields!");
      }
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AuthAppBar(isLogin: false, onPressed: widget.togglePages!),
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
                  const AuthWelcomWidget(isLogin: false),
                  SizedBox(height: size.height * 0.10),

                  // first name and last name
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: firstNameController,
                          fieldType: FieldType.firstName,
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      // last name
                      Expanded(
                        child: CustomTextField(
                          controller: lastNameController,
                          fieldType: FieldType.lastName,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),

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

                  SizedBox(height: size.height * 0.02),

                  // sign up

                  // // OR divider
                  // OrDivider(),

                  // // Google Sign-In button
                  // GoogleSigninButton(),
                  // SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        isLoading: context.read<AuthCubit>().state.registerState.isLoading,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            register();
          }
        },
        text: "SIGN UP",
      ),
    );
  }
}
