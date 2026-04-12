part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final BaseState<String> loginState;
  final BaseState<String> registerState;
  final BaseState<String> verifyCodeState;
  final BaseState<String> forgetPasswordState;
  final BaseState<UserEntity> checkSessionState;
  final BaseState<void> logoutState;
  final String? registerEmail;

  const AuthState({
    this.loginState = const BaseState(),
    this.registerState = const BaseState(),
    this.forgetPasswordState = const BaseState(),
    this.verifyCodeState = const BaseState(),
    this.checkSessionState = const BaseState(),
    this.logoutState = const BaseState(),
    this.registerEmail,
  });

  AuthState copyWith({
    BaseState<String>? loginState,
    BaseState<String>? registerState,
    BaseState<String>? forgetPasswordState,
    BaseState<String>? verifyCodeState,
    BaseState<UserEntity>? checkSessionState,
    BaseState<void>? logoutState,
    String? registerEmail,
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      checkSessionState: checkSessionState ?? this.checkSessionState,
      logoutState: logoutState ?? this.logoutState,
      registerEmail: registerEmail ?? this.registerEmail,
    );
  }

  @override
  List<Object?> get props => [
    loginState,
    registerState,
    forgetPasswordState,
    verifyCodeState,
    checkSessionState,
    logoutState,
    registerEmail
  ];
}
