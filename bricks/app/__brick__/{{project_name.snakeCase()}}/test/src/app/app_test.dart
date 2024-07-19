import 'package:{{project_name.snakeCase()}}/src/app/app.dart';
import 'package:{{project_name.snakeCase()}}/src/features/settings/application/settings_service.dart';
import 'package:{{project_name.snakeCase()}}/src/features/settings/data/preferences_repository.dart';
import 'package:{{project_name.snakeCase()}}/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/mocks.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpWidgetPage() async {
    final mockSharedPreferences = MockSharedPreferences();

    await pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(mockSharedPreferences),
          initialSettingsProvider.overrideWithValue(defaultSettings),
        ],
        child: const MyApp(),
      ),
    );
  }
}

void main() {
  testWidgets('MyApp should build MaterialApp.router', (tester) async {
    await tester.pumpWidgetPage();
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('MyApp should have correct restorationScopeId', (tester) async {
    await tester.pumpWidgetPage();
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.restorationScopeId, 'app');
  });

  testWidgets('MyApp should have correct localizationsDelegates',
      (tester) async {
    await tester.pumpWidgetPage();
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.localizationsDelegates, AppLocalizations.localizationsDelegates);
  });

  testWidgets('MyApp should have correct supportedLocales', (tester) async {
    await tester.pumpWidgetPage();
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.supportedLocales, AppLocalizations.supportedLocales);
  });
}
