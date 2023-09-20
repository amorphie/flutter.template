part of 'personal_info_bloc.dart';

sealed class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();
}

class PersonalInfoEventPressContinueButton extends PersonalInfoEvent {
  final String name;
  final String surname;
  final String email;
  final String transitionId;

  const PersonalInfoEventPressContinueButton({
    required this.name,
    required this.surname,
    required this.email,
    required this.transitionId,
  });

  @override
  List<Object?> get props => [name, surname, email, transitionId];
}
