import 'package:burgankuwait/core/component/component_id.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_widget.dart';
import 'package:flutter/material.dart';

// TODO: Delete this class after writing builders for all components
class ComponentToWidgetMapper {
  Widget map({required ComponentId componentId}) {
    switch (componentId) {
      case ComponentId.accountSlider:
        return const SizedBox.shrink();
      case ComponentId.overdraftInfo:
        return const SizedBox.shrink();
      case ComponentId.accountSummary:
        return const SizedBox.shrink();
      case ComponentId.lastTransactions:
        return const SizedBox.shrink();
      case ComponentId.subNavigation:
        return const SubNavigationWidget();
      case ComponentId.unknown:
        return const SizedBox.shrink();
    }
  }
}
