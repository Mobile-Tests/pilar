import 'package:flutter/material.dart';
import 'package:i18n/i18n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = I18nProvider.of(context);
    return MaterialApp(
      title: 'Pilar Mobile Test',
      supportedLocales: i18n.supportedLocales,
      localizationsDelegates: i18n.localizationsDelegates,
      builder: (context, child) {
        final l10n = TestL10n.of(context);
        return Material(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                l10n.title,
                textAlign: TextAlign.center,
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
