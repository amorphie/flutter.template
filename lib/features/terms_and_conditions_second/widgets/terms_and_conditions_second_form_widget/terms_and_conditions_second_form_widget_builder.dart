import 'package:burgankuwait/features/terms_and_conditions_second/widgets/terms_and_conditions_second_form_widget/terms_and_conditions_second_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TermsAndConditionsSecondFormWidgetBuilder extends JsonWidgetBuilder {
  const TermsAndConditionsSecondFormWidgetBuilder._({
    required this.transitionId,
    required this.buttonText,
    required this.contractTitle,
    required this.contractContent,
    required this.toggleText,
  }) : super(numSupportedChildren: 0);

  static const type = 'terms_and_conditions_second_form_widget';

  final String transitionId;
  final String buttonText;
  final String contractTitle;
  final String contractContent;
  final String toggleText;

  static TermsAndConditionsSecondFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return TermsAndConditionsSecondFormWidgetBuilder._(
      transitionId: map["transition_id"] ?? "",
      buttonText: map["button_text"] ?? "",
      contractTitle: map["contract_title"] ?? "",
      contractContent: map["contract_content"] ?? "",
      toggleText: map["toggle_text"] ?? "",
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
      '[TermsAndConditionsSecondFormWidgetBuilder] does not support children.',
    );

    return TermsAndConditionsSecondFormWidget(
      transitionId: transitionId,
      buttonText: buttonText,
      contractTitle: contractTitle,
      contractContent: contractContent,
      toggleText: toggleText,
    );
  }
}
