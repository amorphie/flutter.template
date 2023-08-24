import 'package:burgankuwait/features/account_details/account_details_page_route.dart';
import 'package:burgankuwait/features/add_address/add_address_page_route.dart';
import 'package:burgankuwait/features/home/routing/home_page_route.dart';
import 'package:burgankuwait/features/login/login_page_route.dart';
import 'package:burgankuwait/features/otp/otp_page_route.dart';
import 'package:burgankuwait/features/personal_info/personal_info_page_route.dart';
import 'package:burgankuwait/features/set_password/set_password_page_route.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page_route.dart';
import 'package:burgankuwait/features/set_security_question/set_security_question_page_route.dart';
import 'package:burgankuwait/features/splash/splash_page.dart';
import 'package:burgankuwait/features/terms_and_conditions/terms_and_conditions_page_route.dart';
import 'package:burgankuwait/features/terms_and_conditions_second/terms_and_conditions_second_page_route.dart';
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
        TypedGoRoute<SetPasswordPageRoute>(path: SetPasswordPageRoute.path),
        TypedGoRoute<SetSecurityQuestionPageRoute>(path: SetSecurityQuestionPageRoute.path),
        TypedGoRoute<SetSecurityPicturePageRoute>(path: SetSecurityPicturePageRoute.path),
        TypedGoRoute<TermsAndConditionsRoute>(path: TermsAndConditionsRoute.path),
        TypedGoRoute<TermsAndConditionsSecondRoute>(path: TermsAndConditionsSecondRoute.path),
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
