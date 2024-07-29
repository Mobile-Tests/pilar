import 'package:dashboard/dashboard_service_locator.dart' as dashboard;
import 'package:network/network_service_locator.dart' as network;

/// Initializes the dependencies required for the app.
///
/// This function sets up the service locators for various modules in the
/// application, ensuring that all necessary dependencies are registered and
/// ready to use.
///
/// If any module contains a new service locator, it should be added here.
///
/// Usage:
/// ```dart
/// await initAppDependencies();
/// ```
///
/// This should be called at the beginning of the application startup process.
Future<void> initAppDependencies() async {
  await network.initServiceLocator();
  await dashboard.initServiceLocator();
}
