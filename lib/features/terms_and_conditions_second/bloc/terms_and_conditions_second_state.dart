part of 'terms_and_conditions_second_bloc.dart';

sealed class TermsAndConditionsSecondState extends Equatable {
  const TermsAndConditionsSecondState();
}

class TermsAndConditionsSecondStateInitial extends TermsAndConditionsSecondState {
  final String? navigationPath;

  const TermsAndConditionsSecondStateInitial({this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
