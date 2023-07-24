import 'package:burgankuwait/features/set_password/set_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetPasswordPageRoute extends GoRouteData {
  static const String path = "set-password";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SetPasswordPage();
  }
}
