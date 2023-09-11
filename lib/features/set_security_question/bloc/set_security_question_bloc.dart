import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page_route.dart';
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

    on<SetSecurityQuestionEventFetchComponents>((event, emit) async => _onFetchComponents(emit));
    on<SetSecurityQuestionEventPressChangeButton>((event, emit) => _onChangeButtonPressed(event));
    on<SetSecurityQuestionEventHandleNavigation>(
      (event, emit) => emit(SetSecurityQuestionStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onFetchComponents(Emitter<SetSecurityQuestionState> emit) async {
    emit(SetSecurityQuestionStateLoading());
    var response = await ComponentsNetworkManager(baseUrlLocal).fetchHomePageComponentsByPageId(
      SetSecurityQuestionPageRoute.path,
    );
    emit(SetSecurityQuestionStateLoaded(componentsMap: response));
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
