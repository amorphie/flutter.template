import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/util/brg_input_formatters.dart';
import 'package:burgan_poc/core/util/brg_validator.dart';
import 'package:burgan_poc/core/util/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrgTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? hintText;
  final bool obscureText;

  const BrgTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.border,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      obscureText: obscureText,
    );
  }

  factory BrgTextFormField.tckn({required BuildContext context, required TextEditingController controller}) {
    const tcknLength = 11;
    return BrgTextFormField(
      controller: controller,
      labelText: const LocalizableText(
        tr: "T.C.Kimlik Numarası",
        en: "T.C. Identification Number",
      ).localize(),
      prefixIcon: const Icon(Icons.person, color: Colors.black),
      validator: BrgValidator().tckn,
      keyboardType: TextInputType.number,
      inputFormatters: BrgInputFormatters.onlyNumbers(),
      maxLength: tcknLength,
    );
  }

  factory BrgTextFormField.phoneNumber({required BuildContext context, required TextEditingController controller}) {
    const phoneNumberLength = 10;
    return BrgTextFormField(
      controller: controller,
      labelText: const LocalizableText(
        tr: "Cep Telefonu",
        en: "Phone Number",
      ).localize(),
      hintText: "5**",
      // TODO: Update icon with numeric keyboard icon
      prefixIcon: const Icon(Icons.keyboard, color: Colors.black),
      validator: BrgValidator().phoneNumber,
      keyboardType: TextInputType.number,
      inputFormatters: BrgInputFormatters.onlyNumbers(),
      maxLength: phoneNumberLength,
    );
  }

  factory BrgTextFormField.password({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required FormFieldValidator<String> validator,
    int? maxLength,
    bool onlyDigits = false,
    bool obscureText = true,
  }) {
    return BrgTextFormField(
      controller: controller,
      labelText: labelText,
      validator: validator,
      keyboardType: onlyDigits ? TextInputType.number : null,
      inputFormatters: onlyDigits ? BrgInputFormatters.onlyNumbers() : null,
      maxLength: maxLength,
      obscureText: obscureText,
    );
  }
}
