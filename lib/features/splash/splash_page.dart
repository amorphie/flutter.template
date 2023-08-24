import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:burgankuwait/features/login/login_page.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Check whether user is logged in or not and navigate to login or home page
    return BlocProvider(
      create: (context) => LoginBloc(
        workflowManager: LoginWorkflowManager(),
        signalrConnectionManager: SignalrConnectionManager(),
      ),
      child: const LoginPage(),
    );
  }
}
