import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  PersonalInfoBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const PersonalInfoStateInitial()) {
    _listenForSignalrUpdates();

    on<PersonalInfoEventPressContinueButton>((event, emit) => _onContinueButtonPressed(
          name: event.name,
          surname: event.surname,
          email: event.email,
          transitionId: event.transitionId,
        ));
    on<PersonalInfoEventHandleNavigation>(
      (event, emit) => emit(PersonalInfoStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onContinueButtonPressed({
    required String name,
    required String surname,
    required String email,
    required transitionId,
  }) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPersonalInfo(name, surname, email, transitionId);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(PersonalInfoEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
