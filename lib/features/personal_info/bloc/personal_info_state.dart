part of 'personal_info_bloc.dart';

abstract class PersonalInfoState extends Equatable {
  const PersonalInfoState();
}

class PersonalInfoStateInitial extends PersonalInfoState {
  const PersonalInfoStateInitial();

  @override
  List<Object?> get props => [];
}
