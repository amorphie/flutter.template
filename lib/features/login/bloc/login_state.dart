part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();

  @override
  List<Object?> get props => [];
}
