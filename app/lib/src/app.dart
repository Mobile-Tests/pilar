import 'dart:ui' as ui;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:i18n/i18n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _useDarkTheme(ThemeMode? themeMode) {
    final mode = themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    return mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == ui.Brightness.dark);
  }

  AppThemeData _resolveTheme(ThemeMode? themeMode) {
    final useDarkTheme = _useDarkTheme(themeMode);
    final highContrast = MediaQuery.highContrastOf(context);
    if (useDarkTheme && highContrast) {
      return AppThemeData.highContrastDark(context);
    } else if (useDarkTheme) {
      return AppThemeData.dark(context);
    } else if (highContrast) {
      return AppThemeData.highContrastLight(context);
    } else {
      return AppThemeData.light(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = I18nProvider.of(context);

    // TODO: Implement a way to change the theme mode.
    // Indicated only, not implemented in this test
    const themeMode = ThemeMode.light;
    final appThemeData = _resolveTheme(themeMode);
    return MaterialApp(
      title: 'Pilar Mobile Test',
      theme: appThemeData.theme,
      themeMode: themeMode,
      supportedLocales: i18n.supportedLocales,
      localizationsDelegates: i18n.localizationsDelegates,
      builder: (context, child) {
        final l10n = TestL10n.of(context);
        final appTheme = AppTheme.of(context);
        return Material(
          child: Padding(
            padding: const EdgeInsets.all(x4),
            child: Center(
              child: Text(
                l10n.title,
                textAlign: TextAlign.center,
                style: appTheme.theme.textTheme.titleMedium
                    ?.copyWith(color: appTheme.colorScheme.tertiary),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TestL10n extends I18NextL10n {
  TestL10n.of(super.context)
      : super(
          namespace: 'app',
        );

  String get title => localize('title');
}
