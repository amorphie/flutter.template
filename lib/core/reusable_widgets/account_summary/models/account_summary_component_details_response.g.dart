// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_summary_component_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSummaryComponentDetailsResponse
    _$AccountSummaryComponentDetailsResponseFromJson(
            Map<String, dynamic> json) =>
        AccountSummaryComponentDetailsResponse(
          availableLimit: json['availableLimit'] as String? ?? '',
          totalLimit: json['totalLimit'] as String? ?? '',
          currentDebt: json['currentDebt'] as String? ?? '',
          accountOpeningDate: json['accountOpeningDate'] as String? ?? '',
          monthlyInterestRate: json['monthlyInterestRate'] as String? ?? '',
          yearlyInterestRate: json['yearlyInterestRate'] as String? ?? '',
        );
