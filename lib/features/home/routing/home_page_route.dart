import 'package:burgankuwait/features/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class HomePageRoute extends GoRouteData {
  static const String path = "home";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
