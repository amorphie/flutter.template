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
}
