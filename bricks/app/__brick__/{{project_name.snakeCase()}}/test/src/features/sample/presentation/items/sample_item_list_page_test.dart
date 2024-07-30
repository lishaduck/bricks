import 'package:{{project_name.snakeCase()}}/src/features/sample/presentation/items/sample_items_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/accessibility.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('SampleItemListPage', () {
    testWidgets('should display information for a single page', (tester) async {
      const widget = SampleItemsListPage();

      // Pump the widget to build it
      // Pumping the widget will run the build method and return the widget
      // that was built
      await tester.pumpApp(const Material(child: widget));

      // Verify that the widget displays the expected information
      expect(find.text('SampleItem 1'), findsOneWidget);
    });

    testAccessibilityGuidelines(const Material(child: SampleItemsListPage()));
  });
}
