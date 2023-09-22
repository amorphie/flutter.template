import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/burgan_ui.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
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
    return BrgTransitionListenerWidget(
      transitionId: widget.transitionId,
      signalRServerUrl: AppConstants.workflowHubUrl,
      signalRMethodName: AppConstants.workflowMethodName,
      onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTermsAndConditionsWidget(context),
          _buildContinueButton(context),
        ],
      ),
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

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
