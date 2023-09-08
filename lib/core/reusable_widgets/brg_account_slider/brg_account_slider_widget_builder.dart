import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class BrgAccountSliderWidgetBuilder extends JsonWidgetBuilder {
  const BrgAccountSliderWidgetBuilder({
    required this.openingDate,
    required this.accountBalance,
    required this.availableBalance,
    required this.iban,
    required this.branchDetails,
  }) : super(numSupportedChildren: 0);

  static const type = 'brg_account_slider_widget';

  final String openingDate;
  final String accountBalance;
  final String availableBalance;
  final String iban;
  final String branchDetails;

  static BrgAccountSliderWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return BrgAccountSliderWidgetBuilder(
      openingDate: map["opening_date"],
      accountBalance: map["account_balance"],
      availableBalance: map["available_balance"],
      iban: map["iban"],
      branchDetails: map["branch_details"],
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[AccountSliderWidgetBuilder] does not support children.',
    );

    return BrgAccountSliderWidget(
      openingDate: openingDate,
      accountBalance: accountBalance,
      availableBalance: availableBalance,
      iban: iban,
      branchDetails: branchDetails,
    );
  }
}
