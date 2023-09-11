import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/util/assets.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/form_field_validator_extensions.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/set_password/bloc/set_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetPasswordFormWidget extends StatefulWidget {
  final String transitionId;
  final String labelPassword;
  final String labelRepeatedPassword;
  final String buttonText;
  final int passwordLength;

  const SetPasswordFormWidget({
    Key? key,
    required this.transitionId,
    required this.labelPassword,
    required this.labelRepeatedPassword,
    required this.buttonText,
    required this.passwordLength,
  }) : super(key: key);

  @override
  State<SetPasswordFormWidget> createState() => _SetPasswordFormWidgetState();
}

class _SetPasswordFormWidgetState extends State<SetPasswordFormWidget> {
  late TextEditingController textControllerPassword;
  late TextEditingController textControllerRepeatedPassword;
  late int passwordLength;

  final formKey = GlobalKey<FormState>();

  String get passwordValidationErrorMessage => LocalizableText(
        tr: "Şifre $passwordLength karakterden oluşmalıdır.",
        en: "Password field should contain $passwordLength characters",
      ).localize();

  FormFieldValidator<String> get passwordsMatchValidator => (input) {
        if (input != textControllerPassword.value.text) {
          return const LocalizableText(
            tr: "Şifreler birbiriyle eşleşmiyor.",
            en: "Passwords are not matched.",
          ).localize();
        } else {
          return null;
        }
      };

  @override
  void initState() {
    super.initState();
    passwordLength = widget.passwordLength;
    textControllerPassword = TextEditingController();
    textControllerRepeatedPassword = TextEditingController();
  }

  @override
  void dispose() {
    textControllerPassword.dispose();
    textControllerRepeatedPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPasswordInputWidget(context),
          _buildPasswordConfirmationInputWidget(context),
          _buildChangeButton(context),
        ],
      ),
    );
  }

  Widget _buildPasswordInputWidget(BuildContext context) {
    return BrgTextFormField.password(
      context: context,
      labelText: widget.labelPassword,
      controller: textControllerPassword,
      validator: BrgValidator().minLength(
        minLength: passwordLength,
        errorMessage: passwordValidationErrorMessage,
      ),
      maxLength: passwordLength,
      prefixIcon: SvgPicture.asset(Assets.icKeyboardNumeric.path, width: 8, height: 8, fit: BoxFit.scaleDown),
      obscureText: true,
      onlyDigits: true,
    ).padding(top: 32, bottom: 16);
  }

  Widget _buildPasswordConfirmationInputWidget(BuildContext context) {
    return BrgTextFormField.password(
      context: context,
      labelText: widget.labelRepeatedPassword,
      controller: textControllerRepeatedPassword,
      validator: BrgValidator()
          .minLength(minLength: passwordLength, errorMessage: passwordValidationErrorMessage)
          .mergeWith(passwordsMatchValidator),
      maxLength: passwordLength,
      prefixIcon: SvgPicture.asset(Assets.icKeyboardNumeric.path, width: 8, height: 8, fit: BoxFit.scaleDown),
      obscureText: true,
      onlyDigits: true,
    ).paddingVertical(8);
  }

  Widget _buildChangeButton(BuildContext context) {
    return BrgButton(
      text: widget.buttonText,
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          context.read<SetPasswordBloc>().add(
                SetPasswordEventPressContinueButton(
                  password: textControllerPassword.text,
                  transitionId: widget.transitionId,
                ),
              );
        }
      },
    ).padding(top: 16);
  }
}
