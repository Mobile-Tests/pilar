import 'package:i18n/i18n.dart';

class DesignSystemL10n extends I18NextL10n {
  DesignSystemL10n.of(super.context)
      : super(
          namespace: 'design_system',
        );

  String get searchBarHint => localize('searchBarHint');
  String get searchBarBt => localize('searchBarBt');
}
