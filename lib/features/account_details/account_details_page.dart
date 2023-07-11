import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  final String iban;

  const AccountDetailsPage({Key? key, required this.iban}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(iban.toString())));
  }
}
