import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/personal_info/bloc/personal_info_bloc.dart';
import 'package:burgankuwait/features/personal_info/personal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class PersonalInfoPageRoute extends GoRouteData {
  static const String path = "personal-info";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => PersonalInfoBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      )..add(PersonalInfoEventFetchComponents()),
      child: const PersonalInfoPage(),
    );
  }
}
