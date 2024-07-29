import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:i18n/i18n.dart';
import 'package:i18n/i18next.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return I18nProvider.fromAssetBundle(
      i18nextOptions: I18NextOptions(
        formats: formatters,
        missingInterpolationHandler: interpolationFallback,
      ),
      child: _BaseAppTest(child: child),
    );
  }
}

class _BaseAppTest extends StatelessWidget {
  const _BaseAppTest({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final i18n = I18nProvider.of(context);
    const themeMode = ThemeMode.light;
    final appThemeData = AppThemeData.light();
    return MaterialApp(
      theme: appThemeData.theme,
      themeMode: themeMode,
      supportedLocales: i18n.supportedLocales,
      localizationsDelegates: i18n.localizationsDelegates,
      builder: (context, _) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => Material(child: child),
          )
        ],
      ),
    );
  }
}
