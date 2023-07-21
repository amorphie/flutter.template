import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/util/extensions/string_extensions.dart';

class BrgValidator {
  final _emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String? Function(String?) get email => (input) {
        if (_emailRegex.hasMatch(input.orEmpty)) {
          return null;
        } else {
          return const LocalizableText(
            tr: "E-mail adresinizi doğru girdiğinizden emin olunuz.",
            en: "Check your e-mail address.",
          ).localize();
        }
      };
}
