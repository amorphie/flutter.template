import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/util/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class BrgValidator {
  final _emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _tcknLength = 11;
  final _phoneNumberLength = 10;

  FormFieldValidator<String> get email => (input) => _emailRegex.hasMatch(input.orEmpty)
      ? null
      : const LocalizableText(
          tr: "E-mail adresinizi doğru girdiğinizden emin olunuz.",
          en: "Check your e-mail address.",
        ).localize();

  FormFieldValidator<String> get tckn => (input) => (input?.length ?? 0) < _tcknLength
      ? LocalizableText(
          tr: "T.C.kimlik numarası $_tcknLength karakterden kısadır.",
          en: "T.C. identification number is less than $_tcknLength character.",
        ).localize()
      : null;

  FormFieldValidator<String> get phoneNumber => (input) => (input?.length ?? 0) < _phoneNumberLength
      ? LocalizableText(
          tr: "Telefon numarası $_phoneNumberLength karakterden kısadır.",
          en: "Phone number is less than $_phoneNumberLength character.",
        ).localize()
      : null;

  FormFieldValidator<String> minLength({required int minLength, required String errorMessage}) =>
      (input) => (input?.length ?? 0) < minLength ? errorMessage : null;
}
