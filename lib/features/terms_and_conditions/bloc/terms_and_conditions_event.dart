part of 'terms_and_conditions_bloc.dart';

sealed class TermsAndConditionsEvent extends Equatable {
  const TermsAndConditionsEvent();
}

class TermsAndConditionsEventUpdateContractStatus extends TermsAndConditionsEvent {
  final bool? contract1Accepted;
  final bool? contract2Accepted;

  const TermsAndConditionsEventUpdateContractStatus({this.contract1Accepted, this.contract2Accepted});

  @override
  List<Object?> get props => [contract1Accepted, contract2Accepted];
}

class TermsAndConditionsEventPressContinueButton extends TermsAndConditionsEvent {
  @override
  List<Object?> get props => [];
}

class TermsAndConditionsEventHandleNavigation extends TermsAndConditionsEvent {
  final String navigationPath;

  const TermsAndConditionsEventHandleNavigation({required this.navigationPath});

  @override
  List<Object?> get props => [navigationPath];
}
