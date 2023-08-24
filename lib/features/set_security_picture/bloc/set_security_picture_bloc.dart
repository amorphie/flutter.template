import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_security_picture_event.dart';

part 'set_security_picture_state.dart';

class SetSecurityPictureBloc extends Bloc<SetSecurityPictureEvent, SetSecurityPictureState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  SetSecurityPictureBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const SetSecurityPictureStateInitial()) {
    _listenForSignalrUpdates();

    on<SetSecurityPictureEventPressContinueButton>(
        (event, emit) => _onContinueButtonPressed(selectedPictureId: event.selectedPictureId));
    on<SetSecurityPictureEventHandleNavigation>(
      (event, emit) => emit(SetSecurityPictureStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onContinueButtonPressed({required String selectedPictureId}) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityImage(selectedPictureId);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(SetSecurityPictureEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
