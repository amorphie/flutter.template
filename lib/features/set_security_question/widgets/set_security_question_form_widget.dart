import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_dropdown_button/brg_dropdown_form_field.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/features/set_security_question/bloc/set_security_question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetSecurityQuestionFormWidget extends StatefulWidget {
  final String transitionId;
  final String labelQuestions;
  final String labelAnswer;
  final String buttonText;
  final List<String> questionList;

  const SetSecurityQuestionFormWidget({
    Key? key,
    required this.transitionId,
    required this.labelQuestions,
    required this.labelAnswer,
    required this.buttonText,
    required this.questionList,
  }) : super(key: key);

  @override
  State<SetSecurityQuestionFormWidget> createState() => _SetSecurityQuestionFormWidgetState();
}

class _SetSecurityQuestionFormWidgetState extends State<SetSecurityQuestionFormWidget> {
  late TextEditingController textControllerSelectedQuestion;
  late TextEditingController textControllerAnswer;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textControllerSelectedQuestion = TextEditingController();
    textControllerAnswer = TextEditingController();
  }

  @override
  void dispose() {
    textControllerSelectedQuestion.dispose();
    textControllerAnswer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BrgTransitionListenerWidget(
      transitionId: widget.transitionId,
      signalRServerUrl: AppConstants.workflowHubUrl,
      signalRMethodName: AppConstants.workflowMethodName,
      onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSecurityQuestionDropdownWidget(),
            _buildAnswerInputWidget(context),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityQuestionDropdownWidget() {
    return BrgDropdownFormField(
      itemList: widget.questionList,
      controller: textControllerSelectedQuestion,
      labelText: widget.labelQuestions,
    ).padding(top: 40, bottom: 8);
  }

  Widget _buildAnswerInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: widget.labelAnswer,
      controller: textControllerAnswer,
      validator: BrgValidator().minLength(
        minLength: 1,
        errorMessage: const LocalizableText(
          tr: "Cevap alanı boş bırakılamaz.",
          en: "Answer field can not be empty.",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: widget.buttonText,
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          context.read<SetSecurityQuestionBloc>().add(
                // TODO: Pass selected question ID with answer
                SetSecurityQuestionEventPressChangeButton(
                  answer: textControllerAnswer.text,
                  transitionId: widget.transitionId,
                ),
              );
        }
      },
    ).padding(top: 16);
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
