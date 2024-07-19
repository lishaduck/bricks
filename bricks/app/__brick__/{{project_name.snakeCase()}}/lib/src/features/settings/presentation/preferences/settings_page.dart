import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/settings_service.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingService is updated and
/// Widgets that watch the SettingsService are rebuilt.
@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsService = ref.watch(settingsServiceProvider);
    final themeMode = settingsService.themeMode;

    return Padding(
      padding: const EdgeInsets.all(16),
      // Glue the SettingsController to the theme selection DropdownButton.
      //
      // When a user selects a theme from the dropdown list, the
      // SettingsController is updated, which rebuilds the MaterialApp.
      child: Container(
        alignment: Alignment.topLeft,
        child: DropdownButton(
          // Read the selected themeMode from the controller
          value: themeMode,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: (theme) async {
            final newTheme = theme ?? settingsService.themeMode;

            return ref
                .read(settingsServiceProvider.notifier)
                .updateThemeMode(newTheme);
          },
          items: const [
            DropdownMenuItem(
              key: ValueKey(ThemeMode.system),
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              key: ValueKey(ThemeMode.light),
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              key: ValueKey(ThemeMode.dark),
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
