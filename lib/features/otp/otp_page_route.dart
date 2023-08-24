import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/otp/bloc/otp_bloc.dart';
import 'package:burgankuwait/features/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class OtpPageRoute extends GoRouteData {
  static const String path = "otp";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => OtpBloc(networkManager: LoginWorkflowManager()),
      child: const OtpPage(),
    );
  }
}
