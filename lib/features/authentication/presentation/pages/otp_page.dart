import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/features/main%20page/main_page.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.verifyCodeState.data != null &&
              state.verifyCodeState.data!.isNotEmpty) {
            CustomSnackBar.success(context, "Verification Successful!");

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
              (route) => false,
            );
          } else if (state.verifyCodeState.errorMessage != null &&
              state.verifyCodeState.errorMessage!.isNotEmpty) {
            CustomSnackBar.error(context, state.verifyCodeState.errorMessage!);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightGrey,
            appBar: AppBar(
              title: AppLogo(),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.star, color: theme.primary),
                    ),
                    const SizedBox(height: 20),
                    const AppText(
                      text: "Verification Code",
                      textWeight: FontWeight.bold,
                      textSize: 23,
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      text:
                          "We have sent a 6-digit security code to your registered email address:\n${widget.email}",
                      maxLineText: 4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    Pinput(
                      controller: otpController,
                      autofocus: true,
                      length: 6,
                      separatorBuilder: (index) => const SizedBox(width: 10),
                      defaultPinTheme: PinTheme(
                        width: 55,
                        height: 70,
                        textStyle: TextStyle(
                          fontFamily: 'Podkova',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.primary,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: theme.primary, width: 3),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Verify Code',
                      isLoading: state.verifyCodeState.isLoading,
                      onPressed: () {
                        if (otpController.text.length == 6) {
                          context.read<AuthCubit>().verifyCode(
                            email: widget.email,
                            otp: otpController.text,
                          );
                        } else {
                          CustomSnackBar.error(
                            context,
                            "Please enter 6-digit code",
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
