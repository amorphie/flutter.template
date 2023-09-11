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
  List<Object?> get props => [otp, workflow];
}

class OtpPageEventHandleNavigation extends OtpPageEvent {
  final String navigationPath;

  const OtpPageEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class OtpPageEventFetchComponents extends OtpPageEvent {
  @override
  List<Object?> get props => [];
}
