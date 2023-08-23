part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventLoginWithCredentials extends LoginEvent {
  final String tckn;
  final BrgPhoneNumber phoneNumber;

  const LoginEventLoginWithCredentials({required this.tckn, required this.phoneNumber});

  @override
  List<Object?> get props => [tckn, phoneNumber];
}

class LoginEventNavigateToOtp extends LoginEvent {
  @override
  List<Object?> get props => [];
}
