part of 'terms_and_conditions_second_bloc.dart';

sealed class TermsAndConditionsSecondEvent extends Equatable {
  const TermsAndConditionsSecondEvent();
}

class TermsAndConditionsSecondEventUpdateContractStatus extends TermsAndConditionsSecondEvent {
  final bool contract3Accepted;

  const TermsAndConditionsSecondEventUpdateContractStatus({required this.contract3Accepted});

  @override
  List<Object?> get props => [contract3Accepted];
}

class TermsAndConditionsSecondEventPressContinueButton extends TermsAndConditionsSecondEvent {
  @override
  List<Object?> get props => [];
}

class TermsAndConditionsSecondEventHandleNavigation extends TermsAndConditionsSecondEvent {
  final String navigationPath;

  const TermsAndConditionsSecondEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
