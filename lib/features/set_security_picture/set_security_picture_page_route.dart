import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/set_security_picture/bloc/set_security_picture_bloc.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetSecurityPicturePageRoute extends GoRouteData {
  static const String path = "set-security-picture";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SetSecurityPictureBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      )..add(SetSecurityPictureEventFetchComponents()),
      child: const SetSecurityPicturePage(),
    );
  }
}
