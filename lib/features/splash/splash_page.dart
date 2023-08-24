import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2));
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: "/${LoginPageRoute.path}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("LOADING...", style: TextStyle(fontSize: 40))));
  }
}
