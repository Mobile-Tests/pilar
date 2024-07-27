import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppTextTheme extends TextTheme {
  AppTextTheme({
    AppColorScheme? colorScheme,
  }) : super(
          headlineLarge: TextStyle(
            fontFamily: poppins,
            fontSize: 56.0,
            height: 60.0 / 56.0,
            fontWeight: FontWeight.w700,
            color: colorScheme?.neutralVariant,
          ),
          headlineMedium: TextStyle(
            fontFamily: poppins,
            fontSize: 48.0,
            height: 50.0 / 48.0,
            fontWeight: FontWeight.w600,
            color: colorScheme?.neutralVariant,
          ),
          headlineSmall: TextStyle(
            fontFamily: poppins,
            fontSize: 40.0,
            height: 45.0 / 40.0,
            fontWeight: FontWeight.w600,
            color: colorScheme?.neutralVariant,
          ),
          titleLarge: TextStyle(
            fontFamily: poppins,
            fontSize: 36.0,
            height: 40.0 / 36.0,
            fontWeight: FontWeight.w600,
            color: colorScheme?.neutralVariant,
          ),
          titleMedium: TextStyle(
            fontFamily: poppins,
            fontSize: 24.0,
            height: 28.0 / 24.0,
            fontWeight: FontWeight.w600,
            color: colorScheme?.neutralVariant,
          ),
          titleSmall: TextStyle(
            fontFamily: poppins,
            fontSize: 20.0,
            height: 25.0 / 20.0,
            fontWeight: FontWeight.w600,
            color: colorScheme?.neutralVariant,
          ),
          bodyLarge: TextStyle(
            fontFamily: poppins,
            fontSize: 20.0,
            height: 25.0 / 20.0,
            fontWeight: FontWeight.w400,
            color: colorScheme?.neutralVariant,
          ),
          bodyMedium: TextStyle(
            fontFamily: poppins,
            fontSize: 15.0,
            height: 20.0 / 15.0,
            fontWeight: FontWeight.w400,
            color: colorScheme?.neutralVariant,
          ),
          bodySmall: TextStyle(
            fontFamily: poppins,
            fontSize: 14.0,
            height: 20.0 / 14.0,
            fontWeight: FontWeight.w400,
            color: colorScheme?.neutralVariant,
          ),
          labelLarge: TextStyle(
            fontFamily: poppins,
            fontSize: 16.0,
            height: 25.0 / 16.0,
            fontWeight: FontWeight.w500,
            color: colorScheme?.neutralVariant,
          ),
          labelMedium: TextStyle(
            fontFamily: poppins,
            fontSize: 14.0,
            height: 22.0 / 14.0,
            fontWeight: FontWeight.w500,
            color: colorScheme?.neutralVariant,
          ),
          labelSmall: TextStyle(
            fontFamily: poppins,
            fontSize: 10.0,
            height: 15.0 / 10.0,
            fontWeight: FontWeight.w500,
            color: colorScheme?.neutralVariant,
          ),
        );

  static const poppins = 'Poppins';
}
