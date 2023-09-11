import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_password/set_password_page_route.dart';
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
    _listenForSignalrUpdates();

    on<SetPasswordEventFetchComponents>((event, emit) async => _onFetchComponents(emit));
    on<SetPasswordEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
    on<SetPasswordEventHandleNavigation>(
      (event, emit) => emit(SetPasswordStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onFetchComponents(Emitter<SetPasswordState> emit) async {
    emit(SetPasswordStateLoading());
    var response = await ComponentsNetworkManager(baseUrlLocal).fetchHomePageComponentsByPageId(
      SetPasswordPageRoute.path,
    );
    emit(SetPasswordStateLoaded(componentsMap: response));
  }

  Future _onContinueButtonPressed(SetPasswordEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPassword(event.password, event.transitionId);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(SetPasswordEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
