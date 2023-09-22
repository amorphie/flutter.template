import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_security_question/bloc/set_security_question_bloc.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetSecurityQuestionPageRoute extends GoRouteData {
  static const String path = "set-security-question";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SetSecurityQuestionBloc(
        workflowManager: LoginWorkflowManager(),
        componentsNetworkManager: ComponentsNetworkManager(),
      ),
      child: const SetSecurityQuestionPage(),
    );
  }
}
