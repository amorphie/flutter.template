import 'package:burgankuwait/core/reusable_widgets/account_summary/models/account_summary_component_details_response.dart';

class AccountSummaryWidgetUIModel {
  final String availableLimit;
  final String totalLimit;
  final String currentDebt;
  final String accountOpeningDate;
  final String monthlyInterestRate;
  final String yearlyInterestRate;

  AccountSummaryWidgetUIModel({
    required this.availableLimit,
    required this.totalLimit,
    required this.currentDebt,
    required this.accountOpeningDate,
    required this.monthlyInterestRate,
    required this.yearlyInterestRate,
  });

  AccountSummaryWidgetUIModel.fromResponse(AccountSummaryComponentDetailsResponse response)
      : availableLimit = response.availableLimit,
        totalLimit = response.totalLimit,
        currentDebt = response.currentDebt,
        accountOpeningDate = response.accountOpeningDate,
        monthlyInterestRate = response.monthlyInterestRate,
        yearlyInterestRate = response.yearlyInterestRate;
}
