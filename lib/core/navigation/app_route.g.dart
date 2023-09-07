// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appRoute,
    ];

RouteBase get $appRoute => GoRouteData.$route(
      path: '/',
      factory: $AppRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'welcome',
          factory: $WelcomePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'login',
          factory: $LoginPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'otp',
              factory: $LoginOtpPageRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'register',
          factory: $RegisterPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'otp',
              factory: $RegisterOtpPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'personal-info',
              factory: $PersonalInfoPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'set-password',
              factory: $SetPasswordPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'set-security-question',
              factory: $SetSecurityQuestionPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'set-security-picture',
              factory: $SetSecurityPicturePageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'terms-and-conditions',
              factory: $TermsAndConditionsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'terms-and-conditions-second',
              factory: $TermsAndConditionsSecondRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'home',
          factory: $HomePageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'account-details/:iban',
              factory: $AccountDetailsPageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'add-address',
              factory: $AddAddressPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppRouteExtension on AppRoute {
  static AppRoute _fromState(GoRouterState state) => AppRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WelcomePageRouteExtension on WelcomePageRoute {
  static WelcomePageRoute _fromState(GoRouterState state) => WelcomePageRoute();

  String get location => GoRouteData.$location(
        '/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) => LoginPageRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginOtpPageRouteExtension on LoginOtpPageRoute {
  static LoginOtpPageRoute _fromState(GoRouterState state) =>
      LoginOtpPageRoute();

  String get location => GoRouteData.$location(
        '/login/otp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterPageRouteExtension on RegisterPageRoute {
  static RegisterPageRoute _fromState(GoRouterState state) =>
      RegisterPageRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterOtpPageRouteExtension on RegisterOtpPageRoute {
  static RegisterOtpPageRoute _fromState(GoRouterState state) =>
      RegisterOtpPageRoute();

  String get location => GoRouteData.$location(
        '/register/otp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PersonalInfoPageRouteExtension on PersonalInfoPageRoute {
  static PersonalInfoPageRoute _fromState(GoRouterState state) =>
      PersonalInfoPageRoute();

  String get location => GoRouteData.$location(
        '/register/personal-info',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SetPasswordPageRouteExtension on SetPasswordPageRoute {
  static SetPasswordPageRoute _fromState(GoRouterState state) =>
      SetPasswordPageRoute();

  String get location => GoRouteData.$location(
        '/register/set-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SetSecurityQuestionPageRouteExtension
    on SetSecurityQuestionPageRoute {
  static SetSecurityQuestionPageRoute _fromState(GoRouterState state) =>
      SetSecurityQuestionPageRoute();

  String get location => GoRouteData.$location(
        '/register/set-security-question',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SetSecurityPicturePageRouteExtension on SetSecurityPicturePageRoute {
  static SetSecurityPicturePageRoute _fromState(GoRouterState state) =>
      SetSecurityPicturePageRoute();

  String get location => GoRouteData.$location(
        '/register/set-security-picture',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TermsAndConditionsRouteExtension on TermsAndConditionsRoute {
  static TermsAndConditionsRoute _fromState(GoRouterState state) =>
      TermsAndConditionsRoute();

  String get location => GoRouteData.$location(
        '/register/terms-and-conditions',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TermsAndConditionsSecondRouteExtension
    on TermsAndConditionsSecondRoute {
  static TermsAndConditionsSecondRoute _fromState(GoRouterState state) =>
      TermsAndConditionsSecondRoute();

  String get location => GoRouteData.$location(
        '/register/terms-and-conditions-second',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountDetailsPageRouteExtension on AccountDetailsPageRoute {
  static AccountDetailsPageRoute _fromState(GoRouterState state) =>
      AccountDetailsPageRoute(
        iban: state.pathParameters['iban']!,
      );

  String get location => GoRouteData.$location(
        '/home/account-details/${Uri.encodeComponent(iban)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddAddressPageRouteExtension on AddAddressPageRoute {
  static AddAddressPageRoute _fromState(GoRouterState state) =>
      AddAddressPageRoute();

  String get location => GoRouteData.$location(
        '/home/add-address',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
