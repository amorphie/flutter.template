import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'terms_and_conditions_second_event.dart';

part 'terms_and_conditions_second_state.dart';

class TermsAndConditionsSecondBloc extends Bloc<TermsAndConditionsSecondEvent, TermsAndConditionsSecondState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  bool _contract3Accepted = false;

  TermsAndConditionsSecondBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const TermsAndConditionsSecondStateInitial()) {
    _listenForSignalrUpdates();

    on<TermsAndConditionsSecondEventUpdateContractStatus>((event, emit) => _onUpdateContractStatus(
          contract3Accepted: event.contract3Accepted,
        ));
    on<TermsAndConditionsSecondEventPressContinueButton>((event, emit) => _onContinueButtonPressed());
    on<TermsAndConditionsSecondEventHandleNavigation>(
      (event, emit) => emit(TermsAndConditionsSecondStateInitial(navigationPath: event.navigationPath)),
    );
  }

  void _onUpdateContractStatus({required bool contract3Accepted}) {
    _contract3Accepted = contract3Accepted;
  }

  Future _onContinueButtonPressed() async {
    if (!_contract3Accepted) {
      return;
    }
    await workflowManager.getTransitions();
    await workflowManager.submitThirdContract(contract3: _contract3Accepted);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(TermsAndConditionsSecondEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
