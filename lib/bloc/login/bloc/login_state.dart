part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = AuthenticationStatus.unknown,
  });

  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final AuthenticationStatus formStatus;

  LoginState copyWith({
    String? username,
    String? password,
    AuthenticationStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, formStatus];
}
