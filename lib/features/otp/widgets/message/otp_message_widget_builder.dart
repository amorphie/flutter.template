import 'package:burgankuwait/features/otp/widgets/message/otp_message_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class OtpMessageWidgetBuilder extends JsonWidgetBuilder {
  const OtpMessageWidgetBuilder._({required this.message}) : super(numSupportedChildren: 0);

  static const type = 'otp_message_widget';

  final String message;

  static OtpMessageWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return OtpMessageWidgetBuilder._(
      message: map["message"] ?? "",
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
      '[OtpMessageWidgetBuilder] does not support children.',
    );

    return OtpMessageWidget(message: message);
  }
}
