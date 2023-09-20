part of 'set_password_bloc.dart';

sealed class SetPasswordState extends Equatable {
  const SetPasswordState();
}

class SetPasswordStateInitial extends SetPasswordState {
  const SetPasswordStateInitial();

  @override
  List<Object?> get props => [];
}
