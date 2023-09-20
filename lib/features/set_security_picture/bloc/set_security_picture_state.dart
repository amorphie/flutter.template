part of 'set_security_picture_bloc.dart';

sealed class SetSecurityPictureState extends Equatable {
  const SetSecurityPictureState();
}

class SetSecurityPictureStateInitial extends SetSecurityPictureState {
  final String? navigationPath;

  const SetSecurityPictureStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
