import 'package:flutter/services.dart';

class BrgInputFormatters {
  BrgInputFormatters._();

  static final _allowOnlyNumbers = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  static List<TextInputFormatter> onlyNumbers() => [_allowOnlyNumbers];
}
