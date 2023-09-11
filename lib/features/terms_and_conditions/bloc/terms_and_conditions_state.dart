part of 'terms_and_conditions_bloc.dart';

sealed class TermsAndConditionsState extends Equatable {
  const TermsAndConditionsState();
}

class TermsAndConditionsStateInitial extends TermsAndConditionsState {
  final String? navigationPath;

  const TermsAndConditionsStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}

class TermsAndConditionsStateLoading extends TermsAndConditionsState {
  @override
  List<Object> get props => [];
}

class TermsAndConditionsStateLoaded extends TermsAndConditionsState {
  final Map<String, dynamic> componentsMap;

  const TermsAndConditionsStateLoaded({required this.componentsMap});

  @override
  List<Object> get props => [componentsMap];
}
