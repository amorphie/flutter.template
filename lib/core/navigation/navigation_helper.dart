import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class NavigationHelper {
  navigate({required BuildContext context, required NavigationType navigationType, required String path}) {
    switch (navigationType) {
      case NavigationType.go:
        context.go(path);
        break;

      case NavigationType.push:
        context.push(path);
        break;

      case NavigationType.pushReplacement:
        context.pushReplacement(path);
        break;

      case NavigationType.replace:
        context.replace(path);
        break;

      case NavigationType.popup:
        // TODO: Display page as popup
        break;

      case NavigationType.bottomSheet:
        // TODO: Display bottomSheet
        break;
    }
  }
}
