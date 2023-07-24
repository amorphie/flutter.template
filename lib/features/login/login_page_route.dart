import 'package:burgankuwait/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class LoginPageRoute extends GoRouteData {
  static const String path = "login";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

