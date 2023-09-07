import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/otp/bloc/otp_bloc.dart';
import 'package:burgankuwait/features/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class LoginOtpPageRoute extends GoRouteData {
  static const String path = "otp";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => OtpBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      ),
      child: const OtpPage(workflow: BrgWorkflow.login),
    );
  }
}
