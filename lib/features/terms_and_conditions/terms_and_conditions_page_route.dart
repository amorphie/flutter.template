import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:burgankuwait/features/terms_and_conditions/bloc/terms_and_conditions_bloc.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

@immutable
class TermsAndConditionsRoute extends GoRouteData {
  static const String path = "terms-and-conditions";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => TermsAndConditionsBloc(
        workflowManager: LoginWorkflowManager(),
        componentsNetworkManager: ComponentsNetworkManager(),
      ),
      child: const TermsAndConditionsPage(),
    );
  }
}
