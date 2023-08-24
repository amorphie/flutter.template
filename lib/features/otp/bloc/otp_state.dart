part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpStateInitial extends OtpState {
  const OtpStateInitial({this.navigateToPersonalInfo = false});

  @override
  List<Object> get props => [navigateToPersonalInfo];

  final bool navigateToPersonalInfo;
}
