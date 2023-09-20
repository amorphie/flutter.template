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
  final String transitionId;

  const TermsAndConditionsEventPressContinueButton({required this.transitionId});

  @override
  List<Object?> get props => [transitionId];
}
