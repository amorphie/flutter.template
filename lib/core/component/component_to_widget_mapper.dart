import 'package:burgankuwait/core/component/component_id.dart';
import 'package:burgankuwait/core/reusable_widgets/account_slider/account_slider_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/last_transactions/last_transactions_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/overdraft_info/overdraft_info_widget.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_widget.dart';
import 'package:flutter/material.dart';

class ComponentToWidgetMapper {
  Widget map({required ComponentId componentId}) {
    switch (componentId) {
      case ComponentId.accountSlider:
        return const AccountSliderWidget();
      case ComponentId.overdraftInfo:
        return const OverdraftInfoWidget();
      case ComponentId.accountSummary:
        return const AccountSummaryWidget();
      case ComponentId.lastTransactions:
        return const LastTransactionWidget();
      case ComponentId.subNavigation:
        return const SubNavigationWidget();
      case ComponentId.unknown:
        return const SizedBox.shrink();
    }
  }
}
