part of 'set_security_question_bloc.dart';

sealed class SetSecurityQuestionState extends Equatable {
  const SetSecurityQuestionState();
}

class SetSecurityQuestionStateInitial extends SetSecurityQuestionState {
  const SetSecurityQuestionStateInitial();

  @override
  List<Object?> get props => [];
}
