part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  final String? navigationPath;

  const LoginStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
