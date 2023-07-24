import 'dart:io';

import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/navigation/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      title: 'Burgan Kuwait',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final _routerConfig = GoRouter(
  initialLocation: AppRoute.path,
  routes: $appRoutes,
);

// TODO: Delete this overrides
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
