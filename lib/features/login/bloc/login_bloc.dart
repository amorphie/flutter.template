import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/login/models/login_entity.dart';
import 'package:burgankuwait/features/login/models/login_register_request.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  LoginBloc({required this.workflowManager, required this.signalrConnectionManager})
      : super(const LoginStateInitial()) {
    _listenForSignalrUpdates();
    on<LoginEventLoginWithCredentials>((event, emit) => _onLoginWithCredentials(event, emit));
    on<LoginEventHandleNavigation>((event, emit) => emit(LoginStateInitial(navigationPath: event.navigationPath)));
  }

  Future _onLoginWithCredentials(LoginEventLoginWithCredentials event, Emitter<LoginState> emit) async {
    workflowManager.resetRecordId();
    await workflowManager.getTransitions();
    await workflowManager.login(
      LoginRegisterRequest(
        LoginEntity(tckn: event.tckn, phoneNumber: event.phoneNumber),
      ),
    );
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(LoginEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
