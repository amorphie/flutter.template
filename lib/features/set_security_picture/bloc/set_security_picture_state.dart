part of 'set_security_picture_bloc.dart';

sealed class SetSecurityPictureState extends Equatable {
  const SetSecurityPictureState();
}

class SetSecurityPictureStateInitial extends SetSecurityPictureState {
  const SetSecurityPictureStateInitial();

  @override
  List<Object?> get props => [];
}
