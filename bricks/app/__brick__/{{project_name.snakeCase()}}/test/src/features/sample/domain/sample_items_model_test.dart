import 'package:{{project_name.snakeCase()}}/src/features/sample/domain/sample_items_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SampleItemsModel', () {
    test('should be constant and support value equality', () {
      // Arrange
      const model = SampleItemsModel(items: []);

      // Act
      final newModel = model.copyWith(items: []);

      // Assert
      expect(newModel, equals(model));
    });
  });
}
