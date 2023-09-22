import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SecurityIconWidgetBuilder extends JsonWidgetBuilder {
  const SecurityIconWidgetBuilder({
    this.paddingAll,
  }) : super(numSupportedChildren: 0);

  static const type = 'security_icon_widget';

  final double? paddingAll;

  static SecurityIconWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return SecurityIconWidgetBuilder(
      paddingAll: (map["paddingAll"] as int?)?.toDouble(),
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
      '[SecurityIconWidgetBuilder] does not support children.',
    );

    return const SecurityIconWidget().paddingAll(paddingAll ?? 0);
  }
}
