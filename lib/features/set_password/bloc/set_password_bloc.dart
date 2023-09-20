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
    on<SetPasswordEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
  }

  Future _onContinueButtonPressed(SetPasswordEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPassword(event.password, event.transitionId);
  }
}
