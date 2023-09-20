part of 'account_summary_widget_bloc.dart';

sealed class AccountSummaryWidgetEvent extends Equatable {}

class AccountSummaryWidgetEventFetchComponentDetails extends AccountSummaryWidgetEvent {
  final String iban;

  AccountSummaryWidgetEventFetchComponentDetails(this.iban);

  @override
  List<Object?> get props => [iban];
}
