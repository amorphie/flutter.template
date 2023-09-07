import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
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
    on<OtpEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
    on<OtpEventHandleNavigation>((event, emit) => emit(OtpStateInitial(navigationPath: event.navigationPath)));
  }

  Future _onContinueButtonPressed(OtpEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitOtp(event.otp, event.workflow);
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
