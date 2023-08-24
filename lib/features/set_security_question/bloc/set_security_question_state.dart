part of 'set_security_question_bloc.dart';

sealed class SetSecurityQuestionState extends Equatable {
  const SetSecurityQuestionState();
}

class SetSecurityQuestionStateInitial extends SetSecurityQuestionState {
  final String? navigationPath;

  const SetSecurityQuestionStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
