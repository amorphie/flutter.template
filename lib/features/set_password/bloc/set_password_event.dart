part of 'set_password_bloc.dart';

sealed class SetPasswordEvent extends Equatable {
  const SetPasswordEvent();
}

class SetPasswordEventPressContinueButton extends SetPasswordEvent {
  final String password;
  final String transitionId;

  const SetPasswordEventPressContinueButton({required this.password, required this.transitionId});

  @override
  List<Object?> get props => [password];
}
