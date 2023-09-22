import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/burgan_ui.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/features/terms_and_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsFormWidget extends StatefulWidget {
  final String transitionId;
  final String buttonText;
  final String firstContractTitle;
  final String firstContractContent;
  final String firstToggleText;
  final String secondContractTitle;
  final String secondContractContent;
  final String secondToggleText;

  const TermsAndConditionsFormWidget({
    Key? key,
    required this.transitionId,
    required this.buttonText,
    required this.firstContractTitle,
    required this.firstContractContent,
    required this.firstToggleText,
    required this.secondContractTitle,
    required this.secondContractContent,
    required this.secondToggleText,
  }) : super(key: key);

  @override
  State<TermsAndConditionsFormWidget> createState() => _TermsAndConditionsFormWidgetState();
}

class _TermsAndConditionsFormWidgetState extends State<TermsAndConditionsFormWidget> {
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
          _buildTermsAndConditionsWidget(context: context, isFirst: true),
          _buildTermsAndConditionsWidget(context: context, isFirst: false),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditionsWidget({required BuildContext context, required bool isFirst}) {
    return TermsAndConditionsWidget(
      titleText: isFirst ? widget.firstContractTitle : widget.secondContractTitle,
      contentText: isFirst ? widget.firstContractContent : widget.secondContractContent,
      toggleText: isFirst ? widget.firstToggleText : widget.secondToggleText,
      contentMaxHeight: MediaQuery.of(context).size.height * 0.3,
      onSwitchToggled: (bool isAccepted) {
        if (isFirst) {
          context
              .read<TermsAndConditionsBloc>()
              .add(TermsAndConditionsEventUpdateContractStatus(contract1Accepted: isAccepted));
        } else {
          context
              .read<TermsAndConditionsBloc>()
              .add(TermsAndConditionsEventUpdateContractStatus(contract2Accepted: isAccepted));
        }
      },
    ).padding(top: 16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: widget.buttonText,
      onPressed: () {
        context.read<TermsAndConditionsBloc>().add(TermsAndConditionsEventPressContinueButton(
              transitionId: widget.transitionId,
            ));
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
