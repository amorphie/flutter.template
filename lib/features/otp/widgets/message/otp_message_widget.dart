import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class OtpMessageWidget extends StatelessWidget {
  final String message;

  const OtpMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(color: Colors.black),
    ).paddingVertical(8);
  }
}
