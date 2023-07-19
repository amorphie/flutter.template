import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrgAppBar(),
      body: const Column(
        children: [
          Center(child: Text("Otp Page")),
        ],
      ),
    );
  }
}
