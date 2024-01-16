part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.username = '',
    this.password = '',
    this.status = AuthenticationStatus.unknown,
  });

  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final AuthenticationStatus status;

  LoginState copyWith({
    String? username,
    String? password,
    AuthenticationStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [username, password, status];
}
