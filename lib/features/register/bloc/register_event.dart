part of 'register_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class RegisterEventRegisterWithPhoneNumber extends LoginEvent {
  final String tckn;
  final BrgPhoneNumber phoneNumber;

  const RegisterEventRegisterWithPhoneNumber({
    required this.tckn,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [tckn, phoneNumber];
}

class RegisterEventHandleNavigation extends LoginEvent {
  final String navigationPath;

  const RegisterEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
