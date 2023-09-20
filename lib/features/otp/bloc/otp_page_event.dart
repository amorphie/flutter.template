part of 'otp_page_bloc.dart';

abstract class OtpPageEvent extends Equatable {
  const OtpPageEvent();
}

class OtpPageEventPressContinueButton extends OtpPageEvent {
  final String otp;
  final BrgWorkflow workflow;
  final String transitionId;

  const OtpPageEventPressContinueButton({required this.otp, required this.workflow, required this.transitionId});

  @override
  List<Object?> get props => [otp, workflow, transitionId];
}
