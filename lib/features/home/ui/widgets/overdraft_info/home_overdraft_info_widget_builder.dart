import 'package:burgankuwait/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomeOverdraftInfoWidgetBuilder extends JsonWidgetBuilder {
  const HomeOverdraftInfoWidgetBuilder({
    required this.title,
    required this.closeAccountButtonText,
    required this.updateLimitButtonText,
  }) : super(numSupportedChildren: 0);

  static const type = 'home_overdraft_info_widget';

  final String title;
  final String closeAccountButtonText;
  final String updateLimitButtonText;

  static HomeOverdraftInfoWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return HomeOverdraftInfoWidgetBuilder(
      title: map["title"] ?? "",
      closeAccountButtonText: map["close_account_button_text"] ?? "",
      updateLimitButtonText: map["update_limit_button_text"] ?? "",
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
      '[HomeOverdraftInfoWidgetBuilder] does not support children.',
    );

    return HomeOverdraftInfoWidget(
      title: title,
      closeAccountButtonText: closeAccountButtonText,
      updateLimitButtonText: updateLimitButtonText,
    );
  }
}
