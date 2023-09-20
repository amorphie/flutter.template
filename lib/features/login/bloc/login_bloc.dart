import 'package:bloc/bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWorkflowManager workflowManager;

  LoginBloc({required this.workflowManager}) : super(const LoginStateInitial()) {
    on<LoginEventLoginWithCredentials>((event, emit) => _onLoginWithCredentials(event, emit));
  }

  Future _onLoginWithCredentials(LoginEventLoginWithCredentials event, Emitter<LoginState> emit) async {
    workflowManager.resetRecordId();
    await workflowManager.getTransitions();
    await workflowManager.login(username: event.username, password: event.password, transitionId: event.transitionId);
  }
}
