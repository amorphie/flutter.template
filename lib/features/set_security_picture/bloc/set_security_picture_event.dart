part of 'set_security_picture_bloc.dart';

sealed class SetSecurityPictureEvent extends Equatable {
  const SetSecurityPictureEvent();
}

class SetSecurityPictureEventPressContinueButton extends SetSecurityPictureEvent {
  final String selectedPictureId;
  final String transitionId;

  const SetSecurityPictureEventPressContinueButton({required this.selectedPictureId, required this.transitionId});

  @override
  List<Object?> get props => [selectedPictureId];
}

class SetSecurityPictureEventHandleNavigation extends SetSecurityPictureEvent {
  final String navigationPath;

  const SetSecurityPictureEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class SetSecurityPictureEventFetchComponents extends SetSecurityPictureEvent {
  @override
  List<Object?> get props => [];
}
