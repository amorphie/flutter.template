part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class OtpEventPressContinueButton extends OtpEvent {
  final String otp;

  const OtpEventPressContinueButton({required this.otp});
  @override
  List<Object?> get props => [otp];
}

class OtpEventHandleNavigation extends OtpEvent {
  final String navigationPath;

  const OtpEventHandleNavigation({required this.navigationPath});
  @override
  List<Object?> get props => [navigationPath];
}
