import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pump_app.dart';

void testAccessibilityGuidelines(
  Widget widget, {
  List<Override> overrides = const [],
}) {
  group('is accessible', () {
    testWidgets('on Android.', (tester) async {
      await tester.pumpApp(widget, overrides: overrides);

      final handle = tester.ensureSemantics();
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handle.dispose();
    });
    testWidgets('on iOS.', (tester) async {
      await tester.pumpApp(widget, overrides: overrides);

      final handle = tester.ensureSemantics();
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      handle.dispose();
    });
    testWidgets('according to the WCAG.', (tester) async {
      await tester.pumpApp(widget, overrides: overrides);

      final handle = tester.ensureSemantics();
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    });
    testWidgets('with regard to labeling buttons.', (tester) async {
      await tester.pumpApp(widget, overrides: overrides);

      final handle = tester.ensureSemantics();
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      handle.dispose();
    });
  });
}
