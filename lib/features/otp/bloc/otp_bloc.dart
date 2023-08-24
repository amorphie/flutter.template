import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final LoginWorkflowManager workflowManager;

  OtpBloc({required this.workflowManager}) : super(const OtpStateInitial()) {
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
    SignalrConnectionManager(onPageNavigation: _onSignalrNavigation).init();
  }

  _onSignalrNavigation(String navigationPath) {
    add(OtpEventHandleNavigation(navigationPath: navigationPath));
  }
}
