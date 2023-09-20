import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  LoginBloc({required this.workflowManager, required this.signalrConnectionManager})
      : super(const LoginStateInitial()) {
    on<LoginEventLoginWithCredentials>((event, emit) => _onLoginWithCredentials(event, emit));
  }

  Future _onLoginWithCredentials(LoginEventLoginWithCredentials event, Emitter<LoginState> emit) async {
    workflowManager.resetRecordId();
    await workflowManager.getTransitions();
    await workflowManager.login(username: event.username, password: event.password, transitionId: event.transitionId);
  }
}
