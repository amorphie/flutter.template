import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_security_question_event.dart';

part 'set_security_question_state.dart';

class SetSecurityQuestionBloc extends Bloc<SetSecurityQuestionEvent, SetSecurityQuestionState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  SetSecurityQuestionBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const SetSecurityQuestionStateInitial()) {
    on<SetSecurityQuestionEventPressChangeButton>((event, emit) => _onChangeButtonPressed(event));
  }

  Future _onChangeButtonPressed(SetSecurityQuestionEventPressChangeButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityQuestion(answer: event.answer, transitionId: event.transitionId);
  }
}
