import 'package:burgan_poc/features/account_details/account_details_page.dart';
import 'package:burgan_poc/features/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'go_router_builder.g.dart';

@TypedGoRoute<HomeScreenRoute>(
    path: '/',
    routes: [
      TypedGoRoute<AccountDetailsRoute>(
        path: 'account-details/:iban',
      )
    ]
)

@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state)  {
    return const HomePage();
  }
}

@immutable
class AccountDetailsRoute extends GoRouteData {
  final String iban;

  const AccountDetailsRoute({
    required this.iban,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AccountDetailsPage(iban: iban);
  }
}
