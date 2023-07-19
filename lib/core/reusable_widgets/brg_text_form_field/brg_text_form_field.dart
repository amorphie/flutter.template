import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/util/brg_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrgTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const BrgTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.initialValue,
    this.prefixIcon,
    this.validator,
    this.border,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(text: initialValue),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
    );
  }

  factory BrgTextFormField.tckn({required BuildContext context, required TextEditingController controller}) {
    const tcknLength = 11;
    return BrgTextFormField(
      controller: controller,
      labelText: const LocalizableText(
        tr: "T.C.Kimlik Numarası",
        en: "T.C. Identification Number",
      ).localize(context),
      prefixIcon: const Icon(Icons.person, color: Colors.black),
      validator: (input) => (input?.length ?? 0) < tcknLength
          ? const LocalizableText(
              tr: "T.C.kimlik numarası $tcknLength karakterden kısadır.",
              en: "T.C. identification number is less than $tcknLength character.",
            ).localize(context)
          : null,
      keyboardType: TextInputType.number,
      inputFormatters: BrgInputFormatters.onlyNumbers(),
      maxLength: tcknLength,
    );
  }
}
