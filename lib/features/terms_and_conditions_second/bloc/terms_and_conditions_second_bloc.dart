import 'package:bloc/bloc.dart';
import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'terms_and_conditions_second_event.dart';

part 'terms_and_conditions_second_state.dart';

class TermsAndConditionsSecondBloc extends Bloc<TermsAndConditionsSecondEvent, TermsAndConditionsSecondState> {
  final LoginWorkflowManager workflowManager;
  final IComponentsNetworkManager componentsNetworkManager;

  bool _contract3Accepted = false;

  TermsAndConditionsSecondBloc({
    required this.workflowManager,
    required this.componentsNetworkManager,
  }) : super(const TermsAndConditionsSecondStateInitial()) {
    on<TermsAndConditionsSecondEventUpdateContractStatus>((event, emit) => _onUpdateContractStatus(
          contract3Accepted: event.contract3Accepted,
        ));
    on<TermsAndConditionsSecondEventPressContinueButton>((event, emit) => _onContinueButtonPressed(
          transitionId: event.transitionId,
        ));
  }

  void _onUpdateContractStatus({required bool contract3Accepted}) {
    _contract3Accepted = contract3Accepted;
  }

  Future _onContinueButtonPressed({required String transitionId}) async {
    if (!_contract3Accepted) {
      return;
    }
    await workflowManager.getTransitions();
    await workflowManager.submitThirdContract(contract3: _contract3Accepted, transitionId: transitionId);
  }
}
