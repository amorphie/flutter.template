part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventLoginWithCredentials extends LoginEvent {
  final String username;
  final String password;

  const LoginEventLoginWithCredentials({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class LoginEventHandleNavigation extends LoginEvent {
  final String navigationPath;

  const LoginEventHandleNavigation({required this.navigationPath});
  @override
  List<Object?> get props => [navigationPath];
}
