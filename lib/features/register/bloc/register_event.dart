part of 'register_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class RegisterEventRegisterWithPhoneNumber extends LoginEvent {
  final String tckn;
  final BrgPhoneNumber phoneNumber;
  final String transitionId;

  const RegisterEventRegisterWithPhoneNumber({
    required this.tckn,
    required this.phoneNumber,
    required this.transitionId,
  });

  @override
  List<Object?> get props => [tckn, phoneNumber, transitionId];
}
