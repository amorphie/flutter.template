part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpStateInitial extends OtpState {
  final String? navigationPath;

  const OtpStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];

}
