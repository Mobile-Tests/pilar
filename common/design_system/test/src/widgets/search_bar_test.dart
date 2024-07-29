import 'package:core_test/core_test.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/l10n/design_system_l10n.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders SearchBar widget', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        BaseApp(
          child: SearchBar(
            onButtonPressed: expectAsync1((_) {}, count: 0),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(SearchBar));
      final l10n = DesignSystemL10n.of(context);

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(l10n.searchBarHint), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text(l10n.searchBarBt), findsOneWidget);
    });
  });

  testWidgets('should update text field value', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        BaseApp(
          child: SearchBar(
            onButtonPressed: expectAsync1((_) {}, count: 0),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'search');
      expect(find.text('search'), findsOneWidget);
    });
  });

  testWidgets('should call onButtonPressed when button is pressed',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        BaseApp(
          child: SearchBar(
            onButtonPressed: expectAsync1((value) {
              expect(value, 'search');
            }, count: 1),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'search');
      await tester.tap(find.byType(TextButton));
    });
  });
}
