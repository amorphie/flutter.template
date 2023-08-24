import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final LoginWorkflowManager workflowManager;
  final SignalrConnectionManager signalrConnectionManager;

  OtpBloc({required this.workflowManager, required this.signalrConnectionManager}) : super(const OtpStateInitial()) {
    _listenForSignalrUpdates();
    on<OtpEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event.otp));
    on<OtpEventHandleNavigation>((event, emit) => emit(OtpStateInitial(navigationPath: event.navigationPath)));
  }

  Future _onContinueButtonPressed(String otp) async {
    await workflowManager.getTransitions();
    // TODO: Pass transition id to submitOtp method
    await workflowManager.submitOtp(otp);
  }

  _listenForSignalrUpdates() {
    signalrConnectionManager.init(onPageNavigation: _onSignalrNavigation);
  }

  _onSignalrNavigation(String navigationPath) {
    if (isClosed) {
      return;
    }
    add(OtpEventHandleNavigation(navigationPath: navigationPath));
    signalrConnectionManager.stop();
  }
}
