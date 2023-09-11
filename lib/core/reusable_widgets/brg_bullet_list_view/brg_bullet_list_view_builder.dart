import 'package:burgankuwait/core/reusable_widgets/brg_bullet_list_view/brg_bullet_list_view.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class BrgBulletListViewBuilder extends JsonWidgetBuilder {
  const BrgBulletListViewBuilder({required this.bulletList}) : super(numSupportedChildren: 0);

  static const type = 'brg_bullet_list_view';

  final List<String> bulletList;

  static BrgBulletListViewBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return BrgBulletListViewBuilder(
      bulletList: List.castFrom(map["bullet_list"]),
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
      '[BrgBulletListViewBuilder] does not support children.',
    );

    return BrgBulletListView(bulletList: bulletList);
  }
}
