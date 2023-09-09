import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/features/otp/widgets/otp_input_with_submit_button/otp_input_with_submit_button_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class OtpInputWithSubmitButtonWidgetBuilder extends JsonWidgetBuilder {
  const OtpInputWithSubmitButtonWidgetBuilder._({
    required this.title,
    required this.buttonText,
    required this.otpLength,
    required this.workflow,
  }) : super(numSupportedChildren: 0);

  static const type = 'otp_input_with_submit_button_widget';
  static const _defaultOtpLength = 6;

  final String title;
  final String buttonText;
  final int otpLength;
  final BrgWorkflow workflow;

  static OtpInputWithSubmitButtonWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return OtpInputWithSubmitButtonWidgetBuilder._(
      title: map["title"] ?? "",
      buttonText: map["button_text"] ?? "",
      otpLength: map["otp_length"] ?? _defaultOtpLength,
      workflow: map["workflow"] == "register" ? BrgWorkflow.register : BrgWorkflow.login,
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
      '[OtpInputWithSubmitButtonWidgetBuilder] does not support children.',
    );

    return OtpInputWithSubmitButtonWidget(
      title: title,
      buttonText: buttonText,
      otpLength: otpLength,
      workflow: workflow,
    );
  }
}
