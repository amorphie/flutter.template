import 'package:burgankuwait/features/set_security_picture/set_security_picture_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class SetSecurityPicturePageRoute extends GoRouteData {
  static const String path = "set-security-picture";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SetSecurityPicturePage();
  }
}
