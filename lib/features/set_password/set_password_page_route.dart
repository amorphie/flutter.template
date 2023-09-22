import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_password/bloc/set_password_bloc.dart';
import 'package:burgankuwait/features/set_password/set_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetPasswordPageRoute extends GoRouteData {
  static const String path = "set-password";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SetPasswordBloc(
        workflowManager: LoginWorkflowManager(),
        componentsNetworkManager: ComponentsNetworkManager(),
      ),
      child: const SetPasswordPage(),
    );
  }
}
