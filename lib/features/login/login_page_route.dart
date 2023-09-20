import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:burgankuwait/features/login/login_page.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class LoginPageRoute extends GoRouteData {
  static const String path = "login";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => LoginBloc(
        workflowManager: LoginWorkflowManager(),
      ),
      child: const LoginPage(),
    );
  }
}
