import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:burgan_poc/core/reusable_widgets/navigation_button/navigation_button.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kolay Adres Ekle")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton(
              navigationPath: "/account-details/TR987654321?param1=Param1",
              navigationType: NavigationType.go,
              child: Text("Go to Account Details with go command"),
            ),
          ],
        ),
      ),
    );
  }
}
