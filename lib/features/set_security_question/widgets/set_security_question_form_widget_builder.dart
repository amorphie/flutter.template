import 'package:burgankuwait/features/set_security_question/widgets/set_security_question_form_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SetSecurityQuestionFormWidgetBuilder extends JsonWidgetBuilder {
  const SetSecurityQuestionFormWidgetBuilder._({
    required this.transitionId,
    required this.labelQuestions,
    required this.labelAnswer,
    required this.buttonText,
    required this.questionList,
  }) : super(numSupportedChildren: 0);

  static const type = 'set_security_question_form_widget';

  final String transitionId;
  final String labelQuestions;
  final String labelAnswer;
  final String buttonText;
  final List<String> questionList;

  static SetSecurityQuestionFormWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return SetSecurityQuestionFormWidgetBuilder._(
      transitionId: map["transition_id"] ?? "",
      labelQuestions: map["label_question"] ?? "",
      labelAnswer: map["label_answer"] ?? "",
      buttonText: map["button_text"] ?? "",
      questionList: List.castFrom(map["question_list"]),
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
      '[SetSecurityQuestionFormWidgetBuilder] does not support children.',
    );

    return SetSecurityQuestionFormWidget(
      transitionId: transitionId,
      labelQuestions: labelQuestions,
      labelAnswer: labelAnswer,
      buttonText: buttonText,
      questionList: questionList,
    );
  }
}
