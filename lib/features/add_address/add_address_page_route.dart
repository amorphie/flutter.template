import 'package:burgan_poc/features/add_address/add_address_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class AddAddressPageRoute extends GoRouteData {
  static const String path = "add-address";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddAddressPage();
  }
}
