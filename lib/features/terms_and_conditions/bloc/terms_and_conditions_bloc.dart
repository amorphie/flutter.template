import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page_route.dart';
import 'package:equatable/equatable.dart';

part 'terms_and_conditions_event.dart';

part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  bool _contract1Accepted = false;
  bool _contract2Accepted = false;

  TermsAndConditionsBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const TermsAndConditionsStateInitial()) {
    _listenForSignalrUpdates();

    on<TermsAndConditionsEventFetchComponents>((event, emit) async => _onFetchComponents(emit));
    on<TermsAndConditionsEventUpdateContractStatus>((event, emit) => _onUpdateContractStatus(
          contract1Accepted: event.contract1Accepted,
          contract2Accepted: event.contract2Accepted,
        ));
    on<TermsAndConditionsEventPressContinueButton>((event, emit) => _onContinueButtonPressed(
          transitionId: event.transitionId,
        ));
    on<TermsAndConditionsEventHandleNavigation>(
      (event, emit) => emit(TermsAndConditionsStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onFetchComponents(Emitter<TermsAndConditionsState> emit) async {
    emit(TermsAndConditionsStateLoading());
    var response = await ComponentsNetworkManager(baseUrlLocal).fetchHomePageComponentsByPageId(
      TermsAndConditionsRoute.path,
    );
    emit(TermsAndConditionsStateLoaded(componentsMap: response));
  }

  void _onUpdateContractStatus({bool? contract1Accepted, bool? contract2Accepted}) {
    if (contract1Accepted != null) {
      _contract1Accepted = contract1Accepted;
    }
    if (contract2Accepted != null) {
      _contract2Accepted = contract2Accepted;
    }
  }

  Future _onContinueButtonPressed({required String transitionId}) async {
    if (!_contract1Accepted || !_contract2Accepted) {
      return;
    }
    await workflowManager.getTransitions();
    await workflowManager.submitFirstContracts(
      contract1: _contract1Accepted,
      contract2: _contract2Accepted,
      transitionId: transitionId,
    );
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(TermsAndConditionsEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
