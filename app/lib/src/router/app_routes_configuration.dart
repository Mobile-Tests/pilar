import 'package:core/go_router.dart';

import '../splash/splash_route.dart';

/// Configures all the routes for the app.
///
/// This class is responsible for registering all the routes used in the
/// application. Each new route should be added to the `getRoutes` list.
///
/// Usage:
///
/// To add a new route, simply include it in the list within the
/// `getRoutes` method:
///
/// ```dart
/// static List<RouteBase> getRoutes() => [
///       // Add new routes here
///     ];
/// ```
abstract class AppRoutesConfiguration {
  AppRoutesConfiguration._();

  /// Returns a list of all the routes in the app.
  ///
  /// This method is used to gather all the routes for the app in one place.
  /// Each route should be an instance of a class that extends [RouteBase].
  static List<RouteBase> getRoutes() => [
        SplashRoute(),
      ];
}
