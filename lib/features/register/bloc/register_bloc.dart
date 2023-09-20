import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<LoginEvent, RegisterState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  RegisterBloc({required this.workflowManager, required this.signalrConnectionManager})
      : super(const RegisterStateInitial()) {
    on<RegisterEventRegisterWithPhoneNumber>((event, emit) => _onLoginWithCredentials(event, emit));
  }

  Future _onLoginWithCredentials(RegisterEventRegisterWithPhoneNumber event, Emitter<RegisterState> emit) async {
    workflowManager.resetRecordId();
    await workflowManager.getTransitions();
    await workflowManager.register(tckn: event.tckn, phoneNumber: event.phoneNumber, transitionId: event.transitionId);
  }
}
