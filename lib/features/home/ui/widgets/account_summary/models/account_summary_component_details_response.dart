import 'package:json_annotation/json_annotation.dart';

part 'account_summary_component_details_response.g.dart';

@JsonSerializable(createToJson: false)
class AccountSummaryComponentDetailsResponse {
  @JsonKey(name: "availableLimit", defaultValue: "")
  final String availableLimit;

  @JsonKey(name: "totalLimit", defaultValue: "")
  final String totalLimit;

  @JsonKey(name: "currentDebt", defaultValue: "")
  final String currentDebt;

  @JsonKey(name: "accountOpeningDate", defaultValue: "")
  final String accountOpeningDate;

  @JsonKey(name: "monthlyInterestRate", defaultValue: "")
  final String monthlyInterestRate;

  @JsonKey(name: "yearlyInterestRate", defaultValue: "")
  final String yearlyInterestRate;

  factory AccountSummaryComponentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryComponentDetailsResponseFromJson(json);

  AccountSummaryComponentDetailsResponse({
    required this.availableLimit,
    required this.totalLimit,
    required this.currentDebt,
    required this.accountOpeningDate,
    required this.monthlyInterestRate,
    required this.yearlyInterestRate,
  });
}
