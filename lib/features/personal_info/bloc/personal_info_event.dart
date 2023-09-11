part of 'personal_info_bloc.dart';

sealed class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();
}

class PersonalInfoEventPressContinueButton extends PersonalInfoEvent {
  final String name;
  final String surname;
  final String email;

  const PersonalInfoEventPressContinueButton({required this.name, required this.surname, required this.email});

  @override
  List<Object?> get props => [name, surname, email];
}

class PersonalInfoEventHandleNavigation extends PersonalInfoEvent {
  final String navigationPath;

  const PersonalInfoEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class PersonalInfoEventFetchComponents extends PersonalInfoEvent {
  @override
  List<Object?> get props => [];
}
