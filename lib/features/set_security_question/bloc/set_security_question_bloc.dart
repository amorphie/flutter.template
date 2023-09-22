import 'package:bloc/bloc.dart';
import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_security_question_event.dart';

part 'set_security_question_state.dart';

class SetSecurityQuestionBloc extends Bloc<SetSecurityQuestionEvent, SetSecurityQuestionState> {
  final LoginWorkflowManager workflowManager;
  final IComponentsNetworkManager componentsNetworkManager;

  SetSecurityQuestionBloc({
    required this.workflowManager,
    required this.componentsNetworkManager,
  }) : super(const SetSecurityQuestionStateInitial()) {
    on<SetSecurityQuestionEventPressChangeButton>((event, emit) => _onChangeButtonPressed(event));
  }

  Future _onChangeButtonPressed(SetSecurityQuestionEventPressChangeButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityQuestion(answer: event.answer, transitionId: event.transitionId);
  }
}
