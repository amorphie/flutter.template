import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/otp/bloc/otp_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpInputWithSubmitButtonWidget extends StatefulWidget {
  final String title;
  final String buttonText;
  final int otpLength;
  final BrgWorkflow workflow;

  const OtpInputWithSubmitButtonWidget({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.otpLength,
    required this.workflow,
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
    return Column(
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
            context
                .read<OtpPageBloc>()
                .add(OtpPageEventPressContinueButton(otp: controllerOtp.text, workflow: widget.workflow));
          },
        ),
      ],
    );
  }
}
