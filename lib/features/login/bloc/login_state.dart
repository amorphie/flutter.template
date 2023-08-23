part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  final bool navigateToOtp;

  const LoginStateInitial({this.navigateToOtp = false});

  @override
  List<Object> get props => [navigateToOtp];
}
