import 'package:burgankuwait/features/account_details/account_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class AccountDetailsPageRoute extends GoRouteData {
  static const String path = "account-details/:iban";

  final String iban;

  const AccountDetailsPageRoute({
    required this.iban,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final uri = Uri.parse(state.location);
    final queryParam1 = uri.queryParameters["param1"];
    return AccountDetailsPage(iban: iban, queryParam1: queryParam1);
  }
}
