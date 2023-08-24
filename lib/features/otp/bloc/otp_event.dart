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

class OtpEventNavigateToSetPersonalInfo extends OtpEvent {
  @override
  List<Object?> get props => [];
}
