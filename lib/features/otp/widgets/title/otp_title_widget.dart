import 'package:flutter/material.dart';

class OtpTitleWidget extends StatelessWidget {
  final String title;

  const OtpTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    );
  }
}
