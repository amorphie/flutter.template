import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SpacerBuilder extends JsonWidgetBuilder {
  const SpacerBuilder() : super(numSupportedChildren: 0);

  static const type = 'spacer';

  static SpacerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SpacerBuilder();
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
      '[SpacerBuilder] does not support children.',
    );

    return const Spacer();
  }
}
