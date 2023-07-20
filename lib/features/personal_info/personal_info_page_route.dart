import 'package:burgan_poc/features/personal_info/personal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class PersonalInfoPageRoute extends GoRouteData {
  static const String path = "personal-info";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PersonalInfoPage();
  }
}
