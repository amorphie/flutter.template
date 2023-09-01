import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_page.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/register/bloc/register_bloc.dart';
import 'package:burgankuwait/features/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class RegisterPageRoute extends GoRouteData {
  static const String path = "register";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      ),
      child: const RegisterPage(),
    );
  }
}
