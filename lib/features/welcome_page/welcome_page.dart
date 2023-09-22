import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/navigation/app_route.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:burgankuwait/features/register/register_page_route.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.white,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              BrgButton(text: "LOGIN", onPressed: () => LoginPageRoute().go(context)).padding(top: 200),
              BrgButton(
                text: "REGISTER",
                onPressed: () => RegisterPageRoute().go(context),
                color: Colors.white,
                textColor: Colors.blue,
              ).padding(top: 24),
            ],
          ).paddingHorizontal(32),
        ),
      ),
    );
  }
}
