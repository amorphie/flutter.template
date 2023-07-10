part of 'account_summary_widget_bloc.dart';

sealed class AccountSummaryWidgetEvent extends Equatable {}

class AccountSummaryWidgetEventSetUIModel extends AccountSummaryWidgetEvent{
  final AccountSummaryWidgetUIModel uiModel;

  AccountSummaryWidgetEventSetUIModel(this.uiModel);

  @override
  List<Object?> get props => [uiModel];
}



