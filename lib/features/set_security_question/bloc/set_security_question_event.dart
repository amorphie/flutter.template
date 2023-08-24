part of 'set_security_question_bloc.dart';

sealed class SetSecurityQuestionEvent extends Equatable {
  const SetSecurityQuestionEvent();
}

class SetSecurityQuestionEventPressContinueButton extends SetSecurityQuestionEvent {
  final String answer;

  const SetSecurityQuestionEventPressContinueButton({required this.answer});

  @override
  List<Object?> get props => [answer];
}

class SetSecurityQuestionEventHandleNavigation extends SetSecurityQuestionEvent {
  final String navigationPath;

  const SetSecurityQuestionEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
