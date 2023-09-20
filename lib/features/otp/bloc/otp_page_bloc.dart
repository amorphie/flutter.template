import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'otp_page_event.dart';

part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, OtpPageState> {
  final LoginWorkflowManager workflowManager;

  OtpPageBloc({required this.workflowManager}) : super(const OtpPageStateInitial()) {
    on<OtpPageEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
  }

  Future _onContinueButtonPressed(OtpPageEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitOtp(event.otp, event.workflow, event.transitionId);
  }
}
