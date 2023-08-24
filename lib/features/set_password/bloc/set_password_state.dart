part of 'set_password_bloc.dart';

sealed class SetPasswordState extends Equatable {
  const SetPasswordState();
}

class SetPasswordStateInitial extends SetPasswordState {
  final String? navigationPath;

  const SetPasswordStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
