import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final TextEditingController emailController;
  const ForgetPasswordWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.forgetPasswordState.data != null &&
            state.forgetPasswordState.data!.isNotEmpty) {
          CustomSnackBar.success(context, "OTP sent successfully!");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpPage(email: emailController.text),
            ),
          );
        } else if (state.forgetPasswordState.errorMessage != null &&
            state.forgetPasswordState.errorMessage!.isNotEmpty) {
          CustomSnackBar.error(
            context,
            state.forgetPasswordState.errorMessage!,
          );
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.bottomRight,
            child: CustomTextButton(
              isLoading: state.forgetPasswordState.isLoading,
              onPressed: () {
                if (emailController.text.isNotEmpty) {
                  context.read<AuthCubit>().forgetPassword(
                    email: emailController.text,
                  );
                } else {
                  CustomSnackBar.error(
                    context,
                    "Please enter your email first",
                  );
                }
              },
              text: 'Forget password',
            ),
          );
        },
      ),
    );
  }
}
