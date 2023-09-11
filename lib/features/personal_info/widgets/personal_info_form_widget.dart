import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:burgankuwait/features/personal_info/bloc/personal_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoFormWidget extends StatefulWidget {
  final String labelName;
  final String labelSurname;
  final String labelEmail;
  final String buttonText;
  final int nameMinLength;
  final int surnameMinLength;

  const PersonalInfoFormWidget({
    Key? key,
    required this.labelName,
    required this.labelSurname,
    required this.labelEmail,
    required this.buttonText,
    required this.nameMinLength,
    required this.surnameMinLength,
  }) : super(key: key);

  @override
  State<PersonalInfoFormWidget> createState() => _PersonalInfoFormWidgetState();
}

class _PersonalInfoFormWidgetState extends State<PersonalInfoFormWidget> {
  late TextEditingController textControllerName;
  late TextEditingController textControllerSurname;
  late TextEditingController textControllerEmail;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textControllerName = TextEditingController();
    textControllerSurname = TextEditingController();
    textControllerEmail = TextEditingController();
  }

  @override
  void dispose() {
    textControllerName.dispose();
    textControllerSurname.dispose();
    textControllerEmail.dispose();
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
          _buildNameInputWidget(context),
          _buildSurnameInputWidget(context),
          _buildEmailInputWidget(context),
          _buildContinueButton(context),
        ],
      ).paddingHorizontal(32),
    );
  }

  Widget _buildNameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: widget.labelName,
      controller: textControllerName,
      validator: BrgValidator().minLength(
        minLength: widget.nameMinLength,
        errorMessage: LocalizableText(
          tr: "Ad alanı en az ${widget.nameMinLength} karakterden oluşmalıdır.",
          en: "Name field should contain at least ${widget.nameMinLength} characters",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildSurnameInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "Soyad", en: "Surname").localize(),
      controller: textControllerSurname,
      validator: BrgValidator().minLength(
        minLength: widget.surnameMinLength,
        errorMessage: LocalizableText(
          tr: "Soyad alanı en az ${widget.surnameMinLength} karakterden oluşmalıdır.",
          en: "Surname field should contain at least ${widget.surnameMinLength} characters",
        ).localize(),
      ),
    ).paddingVertical(16);
  }

  Widget _buildEmailInputWidget(BuildContext context) {
    return BrgTextFormField(
      labelText: const LocalizableText(tr: "E-posta", en: "E-mail").localize(),
      controller: textControllerEmail,
      validator: BrgValidator().email,
    ).paddingVertical(16);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: widget.buttonText,
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          context.read<PersonalInfoBloc>().add(
                PersonalInfoEventPressContinueButton(
                  name: textControllerName.text,
                  surname: textControllerSurname.text,
                  email: textControllerEmail.text,
                ),
              );
        }
      },
    ).padding(top: 16);
  }
}
