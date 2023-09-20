part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventLoginWithCredentials extends LoginEvent {
  final String username;
  final String password;
  final String transitionId;

  const LoginEventLoginWithCredentials({required this.username, required this.password, required this.transitionId});

  @override
  List<Object?> get props => [username, password, transitionId];
}
