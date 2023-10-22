part of 'authentication_bloc.dart';

enum LoginStatus { init, logingIn, loginFaild, loginSucceed }

class AuthenticationState extends Equatable {
  final LoginStatus loginStatus;
  final String? loginErrorMessage;
  final String? token;

  const AuthenticationState(
      {required this.loginStatus, this.loginErrorMessage, this.token});

  @override
  List<Object?> get props => [loginStatus, loginErrorMessage, token];

  factory AuthenticationState.initial() =>
      const AuthenticationState(loginStatus: LoginStatus.init);

  AuthenticationState copyWith({
    LoginStatus? loginStatus,
    String? errorMessage,
    String? token,
  }) {
    return AuthenticationState(
        loginStatus: loginStatus ?? this.loginStatus,
        loginErrorMessage: errorMessage ?? loginErrorMessage,
        token: this.token ?? token);
  }
}
