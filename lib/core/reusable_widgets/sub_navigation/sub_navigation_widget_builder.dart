import 'package:burgankuwait/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SubNavigationWidgetBuilder extends JsonWidgetBuilder {
  const SubNavigationWidgetBuilder({required this.componentDetailsList}) : super(numSupportedChildren: 0);

  static const type = 'sub_navigation_widget';

  final List<SubNavigationComponentDetails> componentDetailsList;

  static SubNavigationWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return SubNavigationWidgetBuilder(
        componentDetailsList:
            (map['items'] as List<dynamic>).map((e) => SubNavigationComponentDetails.fromJson(e)).toList());
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
      '[SubNavigationWidgetBuilder] does not support children.',
    );

    return SubNavigationWidget(
      componentDetailsList: componentDetailsList,
    );
  }
}
