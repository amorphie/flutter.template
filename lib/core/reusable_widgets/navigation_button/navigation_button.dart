import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/navigation/navigation_helper.dart';
import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Widget child;
  final String navigationPath;
  final NavigationType navigationType;
  final Function? onTap;

  const NavigationButton({
    Key? key,
    required this.child,
    required this.navigationPath,
    required this.navigationType,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
        getIt.get<NavigationHelper>().navigate(
              context: context,
              navigationType: navigationType,
              path: navigationPath,
            );
      },
      child: child,
    );
  }
}
