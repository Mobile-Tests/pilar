import 'package:i18n/i18n.dart';

class HomeL10n extends I18NextL10n {
  HomeL10n.of(super.context)
      : super(
          namespace: 'home',
        );

  String get welcomeTitle => localize('welcomeTitle');
  String get welcomeDescription => localize('welcomeDescription');

  String releaseDate(DateTime date) {
    return localize(
      'releaseDate',
      arguments: {'date': date},
    );
  }

  String get emptyList => localize('emptyList');
  String get moviesFetchError => localize('moviesFetchError');
}
