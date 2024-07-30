import 'package:{{project_name.snakeCase()}}/src/features/settings/application/settings_service.dart';
import 'package:{{project_name.snakeCase()}}/src/features/settings/data/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mocks.dart';

void main() {
  group('PreferencesRepository', () {
    test('should update the theme mode', () async {
      // Arrange
      final mockSharedPreferences = MockSharedPreferences();

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(mockSharedPreferences),
          initialSettingsProvider.overrideWithValue(defaultSettings),
        ],
      );

      // Act
      final repo = container.read(preferencesRepositoryProvider);
      final settings = await repo.load();

      // Assert
      expect(settings.themeMode, ThemeMode.system);
    });

    test('should decode the theme mode', () async {
      // Arrange
      final mockSharedPreferences = MockSharedPreferences();

      when(() => mockSharedPreferences.getString('prefs')).thenReturn(
        '{"themeMode":"dark"}',
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(mockSharedPreferences),
          initialSettingsProvider.overrideWithValue(defaultSettings),
        ],
      );

      // Act
      final repo = container.read(preferencesRepositoryProvider);
      final settings = await repo.load();

      // Assert
      expect(settings.themeMode, ThemeMode.dark);
    });
  });

  group('sharedPreferences', () {
    test('should throw an error if SharedPreferences is not provided', () {
      // Arrange
      final container = ProviderContainer();

      // Act
      PreferencesRepository call() =>
          container.read(preferencesRepositoryProvider);

      // Assert
      expect(call, throwsA(isA<UnimplementedError>()));
    });
  });
}
