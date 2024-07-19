import 'package:{{project_name.snakeCase()}}/src/app/router.dart';
import 'package:{{project_name.snakeCase()}}/src/app/wrapper_page.dart';
import 'package:{{project_name.snakeCase()}}/src/l10n/l10n.dart';
import 'package:{{project_name.snakeCase()}}/src/utils/design.dart';
import 'package:{{project_name.snakeCase()}}/src/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/riverpod.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpWidgetPage() async {
    final container = createContainer(
      overrides: [],
    );
    final routerSubscription = container.listen(routerProvider, (_, __) {});
    final router = routerSubscription.read();

    await pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: router.config(),
          onGenerateTitle: (context) => context.l10n.appTitle,
          theme: theme,
          locale: const Locale('en', 'US'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    await router.pushAll([
      const WrapperRoute(),
    ]);
    await pumpAndSettle();
    expect(router.urlState.url, equals('/'));
    expect(find.byType(WrapperPage), findsOneWidget);
  }
}

void main() {
  group('wrapper page', () {
    group('is accessible', () {
      testWidgets('on Android.', (tester) async {
        await tester.pumpWidgetPage();

        final handle = tester.ensureSemantics();
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });
      testWidgets('on iOS.', (tester) async {
        await tester.pumpWidgetPage();

        final handle = tester.ensureSemantics();
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        handle.dispose();
      });
      testWidgets('according to the WCAG.', (tester) async {
        await tester.pumpWidgetPage();

        final handle = tester.ensureSemantics();
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });
      testWidgets('with regard to labeling buttons.', (tester) async {
        await tester.pumpWidgetPage();

        final handle = tester.ensureSemantics();
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        handle.dispose();
      });
    });
  });
}
