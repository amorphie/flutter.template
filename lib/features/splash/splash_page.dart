import 'package:burgankuwait/features/login/bloc/login_bloc.dart';
import 'package:burgankuwait/features/login/login_network_manager.dart';
import 'package:burgankuwait/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Check whether user is logged in or not and navigate to login or home page
    return BlocProvider(
      create: (context) => LoginBloc(networkManager: LoginNetworkManager()),
      child: const LoginPage(),
    );
  }
}
