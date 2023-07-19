import 'package:burgan_poc/features/login/login_page.dart';
import 'package:burgan_poc/features/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class OtpPageRoute extends GoRouteData {
  static const String path = "otp";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OtpPage();
  }
}
