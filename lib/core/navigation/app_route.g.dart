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
          path: 'account-details/:iban',
          factory: $AccountDetailsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'add-address',
          factory: $AddAddressPageRouteExtension._fromState,
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

extension $AccountDetailsPageRouteExtension on AccountDetailsPageRoute {
  static AccountDetailsPageRoute _fromState(GoRouterState state) =>
      AccountDetailsPageRoute(
        iban: state.pathParameters['iban']!,
      );

  String get location => GoRouteData.$location(
        '/account-details/${Uri.encodeComponent(iban)}',
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
        '/add-address',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
