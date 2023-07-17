import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  final String iban;
  final String? queryParam1;

  const AccountDetailsPage({Key? key, required this.iban, this.queryParam1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Account Details")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(iban),
            Text(queryParam1.toString()),
          ],
        )));
  }
}
