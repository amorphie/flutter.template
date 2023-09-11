import 'package:burgankuwait/features/set_password/widgets/set_password_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SetPasswordFormWidgetBuilder extends JsonWidgetBuilder {
  const SetPasswordFormWidgetBuilder._({
    required this.transitionId,
    required this.labelPassword,
    required this.labelRepeatedPassword,
    required this.buttonText,
    required this.passwordLength,
  }) : super(numSupportedChildren: 0);

  static const type = 'set_password_form_widget';

  final String transitionId;
  final String labelPassword;
  final String labelRepeatedPassword;
  final String buttonText;
  final int passwordLength;

  static SetPasswordFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return SetPasswordFormWidgetBuilder._(
      transitionId: map["transition_id"] ?? "",
      labelPassword: map["label_password"] ?? "",
      labelRepeatedPassword: map["label_repeated_password"] ?? "",
      buttonText: map["button_text"] ?? "",
      passwordLength: map["password_length"],
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
      '[SetPasswordFormWidgetBuilder] does not support children.',
    );

    return SetPasswordFormWidget(
      transitionId: transitionId,
      labelPassword: labelPassword,
      labelRepeatedPassword: labelRepeatedPassword,
      buttonText: buttonText,
      passwordLength: passwordLength,
    );
  }
}
