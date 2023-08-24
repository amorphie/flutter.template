import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final LoginWorkflowManager networkManager;

  OtpBloc({required this.networkManager}) : super(const OtpStateInitial()) {
    _listenForSignalrUpdates();
    on<OtpEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event.otp));
    on<OtpEventNavigateToSetPersonalInfo>((event, emit) => emit(const OtpStateInitial(navigateToPersonalInfo: true)));
  }

  Future _onContinueButtonPressed(String otp) async {
    await networkManager.getTransitions();
    // TODO: Pass transition id to submitOtp method
    await networkManager.submitOtp(otp);
  }

  _listenForSignalrUpdates() {
    SignalrConnectionManager(onPageNavigation: _onNavigateToOtp).init();
  }

  _onNavigateToOtp(bool isNavigationAllowed) {
    if (isNavigationAllowed) {
      add(OtpEventNavigateToSetPersonalInfo());
    }
  }
}
