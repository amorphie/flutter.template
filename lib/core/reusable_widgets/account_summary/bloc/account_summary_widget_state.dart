part of 'account_summary_widget_bloc.dart';

sealed class AccountSummaryWidgetState extends Equatable {}

class AccountSummaryWidgetStateLoading extends AccountSummaryWidgetState {
  @override
  List<Object> get props => [];
}

class AccountSummaryWidgetStateLoaded extends AccountSummaryWidgetState {
  final AccountSummaryWidgetUIModel uiModel;

  AccountSummaryWidgetStateLoaded(this.uiModel);

  @override
  List<Object?> get props => [uiModel];
}
