import 'dart:developer';
import 'dart:ui';

import 'package:i18next/i18next.dart';
import 'package:intl/intl.dart';

/// Gets all the default formatters for the i18next machine
Map<String, ValueFormatter> get formatters => {
      // string
      'uppercase': _toUpperCase,
      'lowercase': _toLowerCase,
      'sentence': _toSentenceCase,
      // DateTime
      'datetime': _datetime,
    };

Object? interpolationFallback(
  Object? value,
  InterpolationFormat format,
  Locale locale,
  I18NextOptions options,
) {
  log(
    'Fallback: value: $value -> format: $format\n'
    '  Migrate this to the new interpolation formatting',
    name: 'interpolation_formatter',
  );
  if (value is DateTime) {
    try {
      return DateFormat(format.name, locale.toString()).format(value);
    } catch (error) {
      return value.toString();
    }
  } else if (value is num) {
    return value.toString();
  }

  return value;
}

String? _toUpperCase(
  Object? value,
  InterpolationFormat format,
  Locale locale,
  I18NextOptions options,
) =>
    value?.toString().toUpperCase();

String? _toLowerCase(
  Object? value,
  InterpolationFormat format,
  Locale locale,
  I18NextOptions options,
) =>
    value?.toString().toLowerCase();

String? _toSentenceCase(
  Object? value,
  InterpolationFormat format,
  Locale locale,
  I18NextOptions options,
) =>
    toBeginningOfSentenceCase(value?.toString());

/// Attempts to format a [DateTime] object in format (if any)
/// Where format could either be a literal format value like "HH:mm".
///
/// e.g. "datetime(format: HH:mm)
Object? _datetime(
  Object? value,
  InterpolationFormat format,
  Locale locale,
  I18NextOptions options,
) {
  try {
    if (value is DateTime) {
      final dateFormat = format.options.stringValue('format');
      return DateFormat(dateFormat, locale.toString()).format(value);
    }
  } catch (_) {
    // TODO: If formatting fails, consider logging the error or providing
    // a default format.

    // As this is a Mobile Pilar Test, I decided to simplify and point
    // out what can be done here.
  }
  return value;
}

extension on Map<String, Object> {
  String? stringValue(String key) {
    final value = this[key];
    return value is String ? value : null;
  }
}
