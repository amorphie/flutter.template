import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page_route.dart';
import 'package:equatable/equatable.dart';

part 'set_security_picture_event.dart';

part 'set_security_picture_state.dart';

class SetSecurityPictureBloc extends Bloc<SetSecurityPictureEvent, SetSecurityPictureState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  SetSecurityPictureBloc({
    required this.workflowManager,
    required this.signalrConnectionManager,
  }) : super(const SetSecurityPictureStateInitial()) {
    _listenForSignalrUpdates();

    on<SetSecurityPictureEventFetchComponents>((event, emit) async => _onFetchComponents(emit));
    on<SetSecurityPictureEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
    on<SetSecurityPictureEventHandleNavigation>(
      (event, emit) => emit(SetSecurityPictureStateInitial(navigationPath: event.navigationPath)),
    );
  }

  Future _onFetchComponents(Emitter<SetSecurityPictureState> emit) async {
    emit(SetSecurityPictureStateLoading());
    var response = await ComponentsNetworkManager(baseUrlLocal).fetchHomePageComponentsByPageId(
      SetSecurityPicturePageRoute.path,
    );
    emit(SetSecurityPictureStateLoaded(componentsMap: response));
  }

  Future _onContinueButtonPressed(SetSecurityPictureEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityImage(
      selectedPictureId: event.selectedPictureId,
      transitionId: event.transitionId,
    );
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(SetSecurityPictureEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
