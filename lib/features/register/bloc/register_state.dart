part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterStateInitial extends RegisterState {
  const RegisterStateInitial();

  @override
  List<Object?> get props => [];
}
