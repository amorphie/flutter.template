import 'package:burgankuwait/features/set_security_question/set_security_question_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetSecurityQuestionPageRoute extends GoRouteData {
  static const String path = "set-security-question";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SetSecurityQuestionPage();
  }
}
