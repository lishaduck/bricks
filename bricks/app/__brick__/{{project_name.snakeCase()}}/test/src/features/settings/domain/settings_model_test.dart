import 'package:{{project_name.snakeCase()}}/src/features/settings/domain/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsModel', () {
    test('should be constant and support value equality', () {
      // Arrange
      const model = SettingsModel(themeMode: ThemeMode.system);

      // Act
      final newModel = model.copyWith(themeMode: ThemeMode.system);

      // Assert
      expect(newModel, equals(model));
    });

    test('should support serialization to and from JSON', () {
      // Arrange
      const model = SettingsModel(themeMode: ThemeMode.system);

      // Act
      final json = model.toJson();
      final newModel = SettingsModel.fromJson(json);

      // Assert
      expect(newModel, equals(model));
    });
  });
}
