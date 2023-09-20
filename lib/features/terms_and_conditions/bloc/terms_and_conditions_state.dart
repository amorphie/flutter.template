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
