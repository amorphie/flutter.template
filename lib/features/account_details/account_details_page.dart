import 'package:burgan_poc/core/navigation/app_route.dart';
import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:burgan_poc/core/reusable_widgets/navigation_button/navigation_button.dart';
import 'package:burgan_poc/features/add_address/add_address_page_route.dart';
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
            const NavigationButton(
              navigationPath: "/${AddAddressPageRoute.path}",
              navigationType: NavigationType.go,
              child: Text("Navigate to add address page with go command"),
            ),
          ],
        )));
  }
}
