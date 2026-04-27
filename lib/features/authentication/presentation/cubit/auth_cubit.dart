import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/config/base_state/base_state.dart';
import 'package:e_commerce/config/error_handler/error_handler.dart';
import 'package:e_commerce/features/authentication/domain/entities/user_entity.dart';
import 'package:e_commerce/features/authentication/domain/usecases/forget_password_use_case.dart';
import 'package:e_commerce/features/authentication/domain/usecases/is_logged_in_use_case.dart';
import 'package:e_commerce/features/authentication/domain/usecases/login_usecase.dart';
import 'package:e_commerce/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:e_commerce/features/authentication/domain/usecases/register_usecase.dart';
import 'package:e_commerce/features/authentication/domain/usecases/verify_code_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;
  final LogoutUsecase _logoutUsecase;

  AuthCubit({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required VerifyCodeUseCase verifyCodeUseCase,
    required ForgetPasswordUseCase forgetPasswordUseCase,
    required IsLoggedInUseCase isLoggedInUseCase,
    required LogoutUsecase logoutUsecase,
  }) : _logoutUsecase = logoutUsecase,
       _registerUsecase = registerUsecase,
       _loginUsecase = loginUsecase,
       _verifyCodeUseCase = verifyCodeUseCase,
       _forgetPasswordUseCase = forgetPasswordUseCase,
       _isLoggedInUseCase = isLoggedInUseCase,
       super(AuthState());

  /// login
  Future<void> login({required String email, required String password}) async {
    try {
      emit(
        state.copyWith(
          loginState: state.loginState.copyWith(
            isLoading: true,
            errorMessage: null,
            data: null,
          ),
        ),
      );
      final result = await _loginUsecase.call(email: email, password: password);

      if (result is SuccessBaseResponse<String>) {
        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              data: result.data,
              isLoading: false,
              errorMessage: null,
            ),
          ),
        );
      } else if (result is ErrorBaseResponse<String>) {
        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              errorMessage: result.errorMessage,
              isLoading: false,
            ),
          ),
        );
        // Clear error immediately after emitting it to avoid repetition
        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(errorMessage: null),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loginState: state.loginState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
      // Clear error immediately after emitting it to avoid repetition
      emit(
        state.copyWith(
          loginState: state.loginState.copyWith(errorMessage: null),
        ),
      );
    }
  }

  /// register
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      emit(
        state.copyWith(
          registerState: state.registerState.copyWith(
            isLoading: true,
            errorMessage: null,
            data: null,
          ),
        ),
      );
      final result = await _registerUsecase.call(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      if (result is SuccessBaseResponse<String>) {
        emit(
          state.copyWith(
            registerState: state.registerState.copyWith(
              data: result.data,
              isLoading: false,
              errorMessage: null,
            ),
            registerEmail: email,
          ),
        );
      } else if (result is ErrorBaseResponse<String>) {
        emit(
          state.copyWith(
            registerState: state.registerState.copyWith(
              errorMessage: result.errorMessage,
              isLoading: false,
            ),
          ),
        );
        // Clear error immediately after emitting it to avoid repetition
        emit(
          state.copyWith(
            registerState: state.registerState.copyWith(errorMessage: null),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          registerState: state.registerState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
      // Clear error immediately after emitting it to avoid repetition
      emit(
        state.copyWith(
          registerState: state.registerState.copyWith(errorMessage: null),
        ),
      );
    }
  }

  /// verify code
  Future<void> verifyCode({required String email, required String otp}) async {
    try {
      emit(
        state.copyWith(
          verifyCodeState: state.verifyCodeState.copyWith(
            isLoading: true,
            errorMessage: null,
            data: null,
          ),
        ),
      );
      final result = await _verifyCodeUseCase.call(email: email, otp: otp);

      if (result is SuccessBaseResponse<String>) {
        emit(
          state.copyWith(
            verifyCodeState: state.verifyCodeState.copyWith(
              data: result.data,
              isLoading: false,
              errorMessage: null,
            ),
          ),
        );
      } else if (result is ErrorBaseResponse<String>) {
        emit(
          state.copyWith(
            verifyCodeState: state.verifyCodeState.copyWith(
              errorMessage: result.errorMessage,
              isLoading: false,
            ),
          ),
        );
        // Clear error immediately after emitting it to avoid repetition
        emit(
          state.copyWith(
            verifyCodeState: state.verifyCodeState.copyWith(errorMessage: null),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          verifyCodeState: state.verifyCodeState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
      // Clear error immediately after emitting it to avoid repetition
      emit(
        state.copyWith(
          verifyCodeState: state.verifyCodeState.copyWith(errorMessage: null),
        ),
      );
    }
  }

  /// forget Password
  Future<void> forgetPassword({required String email}) async {
    try {
      emit(
        state.copyWith(
          forgetPasswordState: state.forgetPasswordState.copyWith(
            isLoading: true,
            errorMessage: null,
            data: null,
          ),
        ),
      );
      final result = await _forgetPasswordUseCase.call(email);

      if (result is SuccessBaseResponse<String>) {
        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              data: result.data,
              isLoading: false,
              errorMessage: null,
            ),
          ),
        );
      } else if (result is ErrorBaseResponse<String>) {
        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              errorMessage: result.errorMessage,
              isLoading: false,
            ),
          ),
        );
        // Clear error immediately after emitting it to avoid repetition
        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              errorMessage: null,
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          forgetPasswordState: state.forgetPasswordState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
      // Clear error immediately after emitting it to avoid repetition
      emit(
        state.copyWith(
          forgetPasswordState: state.forgetPasswordState.copyWith(
            errorMessage: null,
          ),
        ),
      );
    }
  }

  /// check session
  Future<void> checkSession() async {
    try {
      emit(
        state.copyWith(
          checkSessionState: state.checkSessionState.copyWith(
            isLoading: true,
            errorMessage: null,
            data: null,
          ),
        ),
      );
      final loggedIn = await _isLoggedInUseCase.call();

      if (loggedIn) {
        emit(
          state.copyWith(
            checkSessionState: state.checkSessionState.copyWith(
              data: const UserEntity(username: 'authed', email: ''),
              isLoading: false,
              errorMessage: null,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            checkSessionState: state.checkSessionState.copyWith(
              data: null,
              isLoading: false,
              errorMessage: 'Not logged in',
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          checkSessionState: state.checkSessionState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
    }
  }

  /// logout
  Future<void> logout() async {
    try {
      emit(
        state.copyWith(
          logoutState: state.logoutState.copyWith(
            isLoading: true,
            errorMessage: null,
          ),
        ),
      );
      final result = await _logoutUsecase.call();

      if (result is SuccessBaseResponse<void>) {
        emit(
          state.copyWith(
            logoutState: state.logoutState.copyWith(
              isLoading: false,
              errorMessage: null,
            ),
            checkSessionState: const BaseState(), // Reset session data to null
          ),
        );
      } else if (result is ErrorBaseResponse<void>) {
        emit(
          state.copyWith(
            logoutState: state.logoutState.copyWith(
              errorMessage: result.errorMessage,
              isLoading: false,
            ),
          ),
        );
        // Clear error immediately after emitting it to avoid repetition
        emit(
          state.copyWith(
            logoutState: state.logoutState.copyWith(errorMessage: null),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          logoutState: state.logoutState.copyWith(
            errorMessage: ErrorHandler.handle(e),
            isLoading: false,
          ),
        ),
      );
      // Clear error immediately after emitting it to avoid repetition
      emit(
        state.copyWith(
          logoutState: state.logoutState.copyWith(errorMessage: null),
        ),
      );
    }
  }
}
