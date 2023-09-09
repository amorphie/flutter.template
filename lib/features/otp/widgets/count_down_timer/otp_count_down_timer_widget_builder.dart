import 'package:burgankuwait/features/otp/widgets/count_down_timer/otp_count_down_timer_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class OtpCountDownTimerWidgetBuilder extends JsonWidgetBuilder {
  const OtpCountDownTimerWidgetBuilder._({required this.durationInSeconds}) : super(numSupportedChildren: 0);

  static const type = 'otp_count_down_timer_widget';
  static const int _defaultDurationInSec = 120;

  final int durationInSeconds;

  static OtpCountDownTimerWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return OtpCountDownTimerWidgetBuilder._(
      durationInSeconds: map["duration"] ?? _defaultDurationInSec,
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
      '[OtpCountDownTimerWidgetBuilder] does not support children.',
    );

    return OtpCountDownTimerWidget(durationInSeconds: durationInSeconds);
  }
}
