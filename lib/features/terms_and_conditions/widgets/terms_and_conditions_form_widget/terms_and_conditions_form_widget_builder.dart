import 'package:burgankuwait/features/terms_and_conditions/widgets/terms_and_conditions_form_widget/terms_and_conditions_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TermsAndConditionsFormWidgetBuilder extends JsonWidgetBuilder {
  const TermsAndConditionsFormWidgetBuilder._({
    required this.transitionId,
    required this.buttonText,
    required this.firstContractTitle,
    required this.firstContractContent,
    required this.firstToggleText,
    required this.secondContractTitle,
    required this.secondContractContent,
    required this.secondToggleText,
  }) : super(numSupportedChildren: 0);

  static const type = 'terms_and_conditions_form_widget';

  final String transitionId;
  final String buttonText;
  final String firstContractTitle;
  final String firstContractContent;
  final String firstToggleText;
  final String secondContractTitle;
  final String secondContractContent;
  final String secondToggleText;

  static TermsAndConditionsFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return TermsAndConditionsFormWidgetBuilder._(
      transitionId: map["transition_id"] ?? "",
      buttonText: map["button_text"] ?? "",
      firstContractTitle: map["first_contract_title"] ?? "",
      secondContractTitle: map["second_contract_title"] ?? "",
      firstContractContent: map["first_contract_content"] ?? "",
      secondContractContent: map["second_contract_content"] ?? "",
      firstToggleText: map["first_toggle_text"] ?? "",
      secondToggleText: map["second_toggle_text"] ?? "",
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
      '[TermsAndConditionsFormWidgetBuilder] does not support children.',
    );

    return TermsAndConditionsFormWidget(
      transitionId: transitionId,
      buttonText: buttonText,
      firstContractTitle: firstContractTitle,
      firstContractContent: firstContractContent,
      secondContractTitle: secondContractTitle,
      secondContractContent: secondContractContent,
      firstToggleText: firstToggleText,
      secondToggleText: secondToggleText,
    );
  }
}
