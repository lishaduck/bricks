import 'package:{{project_name.snakeCase()}}/src/features/sample/presentation/items/sample_item_details_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/accessibility.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('SampleItemDetailsPage', () {
    testWidgets('should display more information', (tester) async {
      const widget = SampleItemDetailsPage();

      // Pump the widget to build it
      // Pumping the widget will run the build method and return the widget
      // that was built
      await tester.pumpApp(widget);

      // Verify that the widget displays the expected information
      expect(find.text('More Information Here'), findsOneWidget);
    });
  });

  testAccessibilityGuidelines(const SampleItemDetailsPage());
}
