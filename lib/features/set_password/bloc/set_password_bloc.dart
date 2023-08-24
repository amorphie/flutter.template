import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_password_event.dart';

part 'set_password_state.dart';

class SetPasswordBloc extends Bloc<SetPasswordEvent, SetPasswordState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  SetPasswordBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const SetPasswordStateInitial()) {
    _listenForSignalrUpdates();

    on<SetPasswordEventPressContinueButton>((event, emit) => _onContinueButtonPressed(password: event.password));
    on<SetPasswordEventHandleNavigation>(
      (event, emit) => emit(SetPasswordStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onContinueButtonPressed({required String password}) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPassword(password);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(SetPasswordEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
