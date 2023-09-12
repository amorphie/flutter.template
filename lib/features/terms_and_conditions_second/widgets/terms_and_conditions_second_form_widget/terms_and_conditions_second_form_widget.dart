import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/terms_and_conditions/terms_and_conditions_widget.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/bloc/terms_and_conditions_second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsSecondFormWidget extends StatefulWidget {
  final String transitionId;
  final String buttonText;
  final String contractTitle;
  final String contractContent;
  final String toggleText;

  const TermsAndConditionsSecondFormWidget({
    Key? key,
    required this.transitionId,
    required this.buttonText,
    required this.contractTitle,
    required this.contractContent,
    required this.toggleText,
  }) : super(key: key);

  @override
  State<TermsAndConditionsSecondFormWidget> createState() => _TermsAndConditionsSecondFormWidgetState();
}

class _TermsAndConditionsSecondFormWidgetState extends State<TermsAndConditionsSecondFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTermsAndConditionsWidget(context),
        _buildContinueButton(context),
      ],
    );
  }

  Widget _buildTermsAndConditionsWidget(BuildContext context) {
    return TermsAndConditionsWidget(
      titleText: widget.contractTitle,
      contentText: widget.contractContent,
      toggleText: widget.toggleText,
      contentMaxHeight: MediaQuery.of(context).size.height * 0.6,
      onSwitchToggled: (bool isAccepted) {
        context
            .read<TermsAndConditionsSecondBloc>()
            .add(TermsAndConditionsSecondEventUpdateContractStatus(contract3Accepted: isAccepted));
      },
    ).padding(top: 16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: widget.buttonText,
      onPressed: () {
        context.read<TermsAndConditionsSecondBloc>().add(
              TermsAndConditionsSecondEventPressContinueButton(transitionId: widget.transitionId),
            );
      },
    ).padding(top: 16);
  }
}
