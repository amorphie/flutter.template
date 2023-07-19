import 'package:burgan_poc/features/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Check whether user is logged in or not and navigate to login or home page
    return const LoginPage();
  }
}
