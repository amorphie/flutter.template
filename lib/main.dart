import 'package:burgan_ui/burgan_ui.dart';
import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/navigation/app_route.dart';
import 'package:burgankuwait/core/reusable_widgets/custom_widget_registerer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  configureDependencies();
  BurganUI.init();
  CustomWidgetRegisterer().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      title: 'Burgan Template',
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
