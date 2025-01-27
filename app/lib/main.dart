import 'package:flutter/material.dart';
import 'package:i18n/i18n.dart';
import 'package:i18n/i18next.dart';

import 'app_service_locator.dart';
import 'src/app.dart';

void main() async {
  // Ensure Flutter is properly initialized before further setup.
  WidgetsFlutterBinding.ensureInitialized();

  await initAppDependencies();

  runApp(
    I18nProvider.fromAssetBundle(
      i18nextOptions: I18NextOptions(
        formats: formatters,
        missingInterpolationHandler: interpolationFallback,
      ),
      child: const App(),
    ),
  );
}
