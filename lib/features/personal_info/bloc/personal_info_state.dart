part of 'personal_info_bloc.dart';

abstract class PersonalInfoState extends Equatable {
  const PersonalInfoState();
}

class PersonalInfoStateInitial extends PersonalInfoState {
  final String? navigationPath;

  const PersonalInfoStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class PersonalInfoStateLoading extends PersonalInfoState {
  @override
  List<Object> get props => [];
}

class PersonalInfoStateLoaded extends PersonalInfoState {
  final Map<String, dynamic> componentsMap;

  const PersonalInfoStateLoaded({required this.componentsMap});

  @override
  List<Object> get props => [componentsMap];
}
