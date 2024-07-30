import 'package:core/provider.dart';
import 'package:flutter/material.dart';

import '../utils/spacings.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

/// The main theme used by the app.
/// This is the root theme for most or all of app design system's
/// foundational values.
///
/// It should be noted that if you want to access material's values, then use
/// [Theme.of].
class AppTheme extends Provider<AppThemeData> {
  AppTheme({
    super.key,
    required AppThemeData data,
    super.child,
  }) : super.value(value: data);

  static AppThemeData of(BuildContext context, {bool listen = true}) {
    try {
      return Provider.of<AppThemeData>(context, listen: listen);
    } on ProviderNotFoundException {
      return _fallback();
    }
  }

  /// This fallback is only for conditions where the theme wasn't or can't be
  /// inserted, like tests.
  ///
  /// A theme value should always have been provided in normal conditions.
  static AppThemeData _fallback() => AppThemeData.light();
}

final class AppThemeData {
  AppThemeData._({
    required this.colorScheme,
    required this.theme,
  });

  factory AppThemeData.light() {
    final appColorScheme = AppColorScheme.light();
    final theme = AppThemeData._getTheme(appColorScheme);
    return AppThemeData._(colorScheme: appColorScheme, theme: theme);
  }

  factory AppThemeData.highContrastLight() {
    // TODO: Implement high contrast light theme
    // This would typically involve adjusting colors for better contrast
    // Indicated only, not implemented in this test
    return AppThemeData.light();
  }

  factory AppThemeData.dark() {
    // TODO: Implement dark theme
    // This would typically involve setting darker colors for the theme
    // Indicated only, not implemented in this test
    return AppThemeData.light();
  }

  factory AppThemeData.highContrastDark() {
    // TODO: Implement high contrast dark theme
    // This would typically involve setting high contrast colors in dark mode
    // Indicated only, not implemented in this test
    return AppThemeData.dark();
  }

  final AppColorScheme colorScheme;
  final ThemeData theme;

  static ThemeData _getTheme(AppColorScheme appColorScheme) {
    final textTheme = AppTextTheme(colorScheme: appColorScheme);
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: appColorScheme.primary),
      primarySwatch: appColorScheme.primary,
      textTheme: textTheme,
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(x0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(x8)),
          )),
          minimumSize: WidgetStatePropertyAll(Size(x0, x12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(appColorScheme.primary),
          elevation: const WidgetStatePropertyAll(x0),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(x8)),
          )),
          minimumSize: const WidgetStatePropertyAll(Size(x0, x12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: appColorScheme.neutral[200]),
        contentPadding: const EdgeInsets.all(x4),
        filled: true,
        fillColor: appColorScheme.backgroundContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(x8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
