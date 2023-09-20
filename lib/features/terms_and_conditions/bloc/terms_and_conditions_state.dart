part of 'terms_and_conditions_bloc.dart';

sealed class TermsAndConditionsState extends Equatable {
  const TermsAndConditionsState();
}

class TermsAndConditionsStateInitial extends TermsAndConditionsState {
  const TermsAndConditionsStateInitial();

  @override
  List<Object?> get props => [];
}
