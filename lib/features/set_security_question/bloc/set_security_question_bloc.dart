import 'package:bloc/bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_security_question_event.dart';

part 'set_security_question_state.dart';

class SetSecurityQuestionBloc extends Bloc<SetSecurityQuestionEvent, SetSecurityQuestionState> {
  final LoginWorkflowManager workflowManager;

  SetSecurityQuestionBloc({
    required this.workflowManager,
  }) : super(const SetSecurityQuestionStateInitial()) {
    on<SetSecurityQuestionEventPressChangeButton>((event, emit) => _onChangeButtonPressed(event));
  }

  Future _onChangeButtonPressed(SetSecurityQuestionEventPressChangeButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityQuestion(answer: event.answer, transitionId: event.transitionId);
  }
}
