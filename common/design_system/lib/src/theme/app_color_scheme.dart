import 'package:flutter/material.dart';

class AppColorScheme {
  const AppColorScheme._({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    required this.background,
    required this.backgroundContainer,
  });

  factory AppColorScheme.light() => const AppColorScheme._(
        primary: MaterialColor(0xFF002238, <int, Color>{
          50: Color(0xFFF1F4F8),
          100: Color(0xFFD5DEE9),
          200: Color(0xFFBAC8D9),
          300: Color(0xFF9FB2C9),
          400: Color(0xFF879DB7),
          500: Color(0xFF7089A4),
          600: Color(0xFF5B748F),
          700: Color(0xFF496179),
          800: Color(0xFF384D62),
          900: Color(0xFF2B3B4B),
        }),
        secondary: MaterialColor(0xFF6DC59E, <int, Color>{
          50: Color(0xFFECF6F1),
          100: Color(0xFFC5E4D4),
          200: Color(0xFFA0D1B9),
          300: Color(0xFF7DBEA0),
          400: Color(0xFF5CAA88),
          500: Color(0xFF3F9672),
          600: Color(0xFF25815E),
          700: Color(0xFF0F6C4C),
          800: Color(0xFF03573B),
          900: Color(0xFF05422D),
        }),
        tertiary: MaterialColor(0xFF00AED4, <int, Color>{
          50: Color(0xFFEAF6FA),
          100: Color(0xFFBEE3F1),
          200: Color(0xFF92CFE6),
          300: Color(0xFF64BCD9),
          400: Color(0xFF2CA8CA),
          500: Color(0xFF0094B8),
          600: Color(0xFF007FA3),
          700: Color(0xFF006A8C),
          800: Color(0xFF005572),
          900: Color(0xFF004157),
        }),
        neutral: MaterialColor(0xFFBDCDD6, <int, Color>{
          50: Color(0xFFF2F4F5),
          100: Color(0xFFD8DEE1),
          200: Color(0xFFBFC8CD),
          300: Color(0xFFA6B2B9),
          400: Color(0xFF8F9DA5),
          500: Color(0xFF7A8991),
          600: Color(0xFF65747C),
          700: Color(0xFF536068),
          800: Color(0xFF414D53),
          900: Color(0xFF313A3F),
        }),
        neutralVariant: MaterialColor(0xFF3D3B40, <int, Color>{
          50: Color(0xFFF4F3F4),
          100: Color(0xFFDDDCDF),
          200: Color(0xFFC7C6C9),
          300: Color(0xFFB2B0B4),
          400: Color(0xFF9C9AA0),
          500: Color(0xFF88858B),
          600: Color(0xFF737177),
          700: Color(0xFF5F5D63),
          800: Color(0xFF4C4B4F),
          900: Color(0xFF3A393C),
        }),
        background: Color(0xFFF4F3F4),
        backgroundContainer: Color(0xFFFFFFFF),
      );

  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor tertiary;
  final MaterialColor neutral;
  final MaterialColor neutralVariant;
  final Color background;
  final Color backgroundContainer;
}
