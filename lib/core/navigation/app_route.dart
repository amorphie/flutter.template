import 'package:burgan_poc/features/account_details/account_details_page_route.dart';
import 'package:burgan_poc/features/add_address/add_address_page_route.dart';
import 'package:burgan_poc/features/home/routing/home_page_route.dart';
import 'package:burgan_poc/features/login/login_page_route.dart';
import 'package:burgan_poc/features/otp/otp_page_route.dart';
import 'package:burgan_poc/features/personal_info/personal_info_page_route.dart';
import 'package:burgan_poc/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_route.g.dart';

@immutable
@TypedGoRoute<AppRoute>(
  path: AppRoute.path,
  routes: [
    TypedGoRoute<LoginPageRoute>(
      path: LoginPageRoute.path,
      routes: [
        TypedGoRoute<OtpPageRoute>(path: OtpPageRoute.path),
        TypedGoRoute<PersonalInfoPageRoute>(path: PersonalInfoPageRoute.path),
      ],
    ),
    TypedGoRoute<HomePageRoute>(
      path: HomePageRoute.path,
      routes: [
        TypedGoRoute<AccountDetailsPageRoute>(path: AccountDetailsPageRoute.path),
        TypedGoRoute<AddAddressPageRoute>(path: AddAddressPageRoute.path),
      ],
    ),
  ],
)
class AppRoute extends GoRouteData {
  static const String path = "/";

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}
