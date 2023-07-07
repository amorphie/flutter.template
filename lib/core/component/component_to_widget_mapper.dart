import 'package:burgan_poc/core/component/component_id.dart';
import 'package:burgan_poc/core/reusable_widgets/account_slider/account_slider_widget.dart';
import 'package:flutter/material.dart';

class ComponentToWidgetMapper {
  Widget map({required String? componentId}) {
    switch (componentId) {
      case ComponentId.accountSlider:
        return const AccountSliderWidget();
      case ComponentId.overdraftInfo:
        return Text("Overdraft info"); // TODO: Extract to widget
      case ComponentId.accountSummary:
        return Text("Account summary"); // TODO: Extract to widget
      case ComponentId.lastTransactions:
        return Text("Last transactions"); // TODO: Extract to widget
      default:
        return const SizedBox.shrink();
    }
  }
}
