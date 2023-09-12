import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/terms_and_conditions_second_page_route.dart';
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

    on<TermsAndConditionsSecondEventFetchComponents>((event, emit) async => _onFetchComponents(emit));
    on<TermsAndConditionsSecondEventUpdateContractStatus>((event, emit) => _onUpdateContractStatus(
          contract3Accepted: event.contract3Accepted,
        ));
    on<TermsAndConditionsSecondEventPressContinueButton>((event, emit) => _onContinueButtonPressed(
      transitionId: event.transitionId,
        ));
    on<TermsAndConditionsSecondEventHandleNavigation>(
      (event, emit) => emit(TermsAndConditionsSecondStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onFetchComponents(Emitter<TermsAndConditionsSecondState> emit) async {
    emit(TermsAndConditionsSecondStateLoading());
    var response = await ComponentsNetworkManager(baseUrlLocal).fetchHomePageComponentsByPageId(
      TermsAndConditionsSecondRoute.path,
    );
    emit(TermsAndConditionsSecondStateLoaded(componentsMap: response));
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
