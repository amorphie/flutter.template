part of 'otp_page_bloc.dart';

abstract class OtpPageState extends Equatable {
  const OtpPageState();
}

class OtpPageStateInitial extends OtpPageState {
  final String? navigationPath;

  const OtpPageStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class OtpPageStateLoading extends OtpPageState {
  @override
  List<Object> get props => [];
}

class OtpPageStateLoaded extends OtpPageState {
  final Map<String, dynamic> componentsMap;

  const OtpPageStateLoaded({required this.componentsMap});

  @override
  List<Object> get props => [componentsMap];
}
