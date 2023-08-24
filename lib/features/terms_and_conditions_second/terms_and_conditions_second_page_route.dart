import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/terms_and_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/bloc/terms_and_conditions_second_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/terms_and_conditions_second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class TermsAndConditionsSecondRoute extends GoRouteData {
  static const String path = "terms-and-conditions-second";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => TermsAndConditionsSecondBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      ),
      child: const TermsAndConditionsSecondPage(),
    );
  }
}
