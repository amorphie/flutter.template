part of 'set_security_question_bloc.dart';

sealed class SetSecurityQuestionEvent extends Equatable {
  const SetSecurityQuestionEvent();
}

class SetSecurityQuestionEventPressChangeButton extends SetSecurityQuestionEvent {
  final String answer;
  final String transitionId;

  const SetSecurityQuestionEventPressChangeButton({required this.answer, required this.transitionId});

  @override
  List<Object?> get props => [answer];
}

class SetSecurityQuestionEventHandleNavigation extends SetSecurityQuestionEvent {
  final String navigationPath;

  const SetSecurityQuestionEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
