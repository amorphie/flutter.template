part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterStateInitial extends RegisterState {
  final String? navigationPath;

  const RegisterStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
