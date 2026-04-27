import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/main%20page/main_page.dart';
import 'package:e_commerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      home: BlocProvider(
        create: (context) => getIt<AuthCubit>()..checkSession(),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state.checkSessionState.isLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.checkSessionState.data != null) {
              return const MainPage();
            }
            return const AuthPage();
          },
        ),
      ),
    );
  }
}
