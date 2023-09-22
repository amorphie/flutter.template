import 'package:burgankuwait/features/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class WelcomePageRoute extends GoRouteData {
  static const String path = "welcome";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomePage();
  }
}
