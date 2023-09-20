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
    _listenForSignalrUpdates();

    on<SetSecurityQuestionEventPressChangeButton>((event, emit) => _onChangeButtonPressed(event));
    on<SetSecurityQuestionEventHandleNavigation>(
      (event, emit) => emit(SetSecurityQuestionStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onChangeButtonPressed(SetSecurityQuestionEventPressChangeButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityQuestion(answer: event.answer, transitionId: event.transitionId);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(SetSecurityQuestionEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
