part of 'set_password_bloc.dart';

sealed class SetPasswordEvent extends Equatable {
  const SetPasswordEvent();
}

class SetPasswordEventPressContinueButton extends SetPasswordEvent {
  final String password;

  const SetPasswordEventPressContinueButton({required this.password});

  @override
  List<Object?> get props => [password];
}

class SetPasswordEventHandleNavigation extends SetPasswordEvent {
  final String navigationPath;

  const SetPasswordEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
