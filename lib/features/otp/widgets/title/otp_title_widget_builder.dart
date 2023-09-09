import 'package:burgankuwait/features/otp/widgets/title/otp_title_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class OtpTitleWidgetBuilder extends JsonWidgetBuilder {
  const OtpTitleWidgetBuilder({required this.title}) : super(numSupportedChildren: 0);

  static const type = 'otp_title_widget';

  final String title;

  static OtpTitleWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return OtpTitleWidgetBuilder(
      title: map["title"] ?? "",
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
      '[OtpTitleWidgetBuilder] does not support children.',
    );

    return OtpTitleWidget(title: title);
  }
}
