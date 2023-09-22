import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/burgan_ui.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/features/otp/bloc/otp_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpInputWithSubmitButtonWidget extends StatefulWidget {
  final String title;
  final String buttonText;
  final int otpLength;
  final BrgWorkflow workflow;
  final String transitionId;

  const OtpInputWithSubmitButtonWidget({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.otpLength,
    required this.workflow,
    required this.transitionId,
  }) : super(key: key);

  @override
  State<OtpInputWithSubmitButtonWidget> createState() => _OtpInputWithSubmitButtonWidgetState();
}

class _OtpInputWithSubmitButtonWidgetState extends State<OtpInputWithSubmitButtonWidget> {
  late TextEditingController controllerOtp;
  late int otpLength;

  @override
  void initState() {
    super.initState();
    controllerOtp = TextEditingController();
    otpLength = widget.otpLength;
  }

  @override
  void dispose() {
    controllerOtp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BrgTransitionListenerWidget(
      transitionId: widget.transitionId,
      signalRServerUrl: AppConstants.workflowHubUrl,
      signalRMethodName: AppConstants.workflowMethodName,
      onPageNavigation: (String navigationPath) => _handleNavigation(context, navigationPath),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BrgTextFormField.password(
            context: context,
            controller: controllerOtp,
            labelText: const LocalizableText(
              tr: "SMS Doğrulama Kodu",
              en: "SMS OTP",
            ).localize(),
            validator: BrgValidator().minLength(
              minLength: otpLength,
              errorMessage: LocalizableText(
                tr: "Şifreniz $otpLength karakterden kısadır.",
                en: "Password is less than $otpLength character.",
              ).localize(),
            ),
            maxLength: otpLength,
            onlyDigits: true,
            obscureText: false,
          ).paddingVertical(16),
          BrgButton(
            text: widget.buttonText,
            onPressed: () {
              context.read<OtpPageBloc>().add(OtpPageEventPressContinueButton(
                    otp: controllerOtp.text,
                    workflow: widget.workflow,
                    transitionId: widget.transitionId,
                  ));
            },
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
