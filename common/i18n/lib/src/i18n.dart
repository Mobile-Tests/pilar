import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18next/i18next.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'single_file_asset_bundle_data_source.dart';
import 'utils.dart';

const List<Locale> kSupportedLocales = <Locale>[
  Locale('pt', 'BR'),
  Locale('en', 'US'),
];

class I18n extends ChangeNotifier {
  I18n({
    Locale? locale,
    required List<Locale> supportedLocales,
    required List<LocalizationsDelegate> localizationsDelegate,
  })  : assert(supportedLocales.isNotEmpty),
        _locale = locale ??
            determineLocale(supportedLocales) ??
            supportedLocales.first,
        supportedLocales = List.unmodifiable(supportedLocales),
        localizationsDelegates = List.unmodifiable(localizationsDelegate) {
    _log('Initializing locale with $_locale');
    _initializeTimeAgo(supportedLocales);
    _setupLocale(_locale);
  }

  final Locale _locale;
  final List<Locale> supportedLocales;
  final List<LocalizationsDelegate> localizationsDelegates;

  void _log(String message, [Object? error, StackTrace? stackTrace]) {
    log(message, error: error, stackTrace: stackTrace, name: 'I18n');
  }

  void _initializeTimeAgo(List<Locale> supportedLocales) {
    final knownMessages = <String, ValueGetter<timeago.LookupMessages>>{
      'pt': timeago.PtBrMessages.new,
      'en': timeago.EnMessages.new,
    };

    for (final locale in supportedLocales) {
      final fullLocale = Intl.canonicalizedLocale(locale.toLanguageTag());
      final shortLocale = locale.languageCode;

      final message = knownMessages[fullLocale] ?? knownMessages[shortLocale];
      assert(
        message != null,
        'Could not find associated timeago lookup message for $locale',
      );
      timeago.setLocaleMessages(
        fullLocale,
        message?.call() ?? timeago.EnMessages(),
      );
    }
  }

  void _setupLocale(Locale locale) {
    final localeString = Intl.canonicalizedLocale(locale.toLanguageTag());
    Intl.defaultLocale = localeString;
    timeago.setDefaultLocale(localeString);
  }
}

class I18nProvider extends ChangeNotifierProvider<I18n> {
  I18nProvider({
    super.key,
    Locale? locale,
    List<Locale> supportedLocales = kSupportedLocales,
    required LocalizationDataSource localizationDataSource,
    I18NextOptions? i18nextOptions,
    super.lazy,
    super.builder,
    super.child,
  })  : assert(supportedLocales.isNotEmpty),
        assert(locale == null || supportedLocales.contains(locale)),
        super(
          create: (context) => I18n(
            locale: locale,
            supportedLocales: supportedLocales,
            localizationsDelegate: [
              ...GlobalMaterialLocalizations.delegates,
              I18NextLocalizationDelegate(
                locales: supportedLocales,
                dataSource: localizationDataSource,
                options: i18nextOptions,
              ),
            ],
          ),
        );

  /// Convenience constructor with the [localizationDataSource] with the default
  /// package corrected [bundlePath].
  I18nProvider.fromAssetBundle({
    Key? key,
    List<Locale> supportedLocales = kSupportedLocales,
    Locale? locale,
    String assetPath = 'packages/i18n/lib/l10n/<locale_name>.json',
    I18NextOptions? i18nextOptions,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : this(
          key: key,
          supportedLocales: supportedLocales,
          locale: locale,
          localizationDataSource: SingleAssetBundleLocalizationDataSource(
            assetPath: assetPath,
          ),
          i18nextOptions: i18nextOptions,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static I18n of(BuildContext context, {bool listen = true}) =>
      Provider.of<I18n>(context, listen: listen);
}
