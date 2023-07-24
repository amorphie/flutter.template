import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class TermsAndConditionsRoute extends GoRouteData {
  static const String path = "terms-and-conditions";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TermsAndConditionsPage();
  }
}
