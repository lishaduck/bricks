// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/settings/application/settings_service.dart';
import '../features/settings/data/preferences_repository.dart';

/// Turn any widget into a flow-blown app.
mixin Bootstrap on Widget {
  /// Bootstrap the app.
  ///
  /// This involves
  /// - setting [FlutterError.onError] to log errors to the console,
  /// - calling [usePathUrlStrategy] to use path-style URLs,
  /// - setting up the [SettingsService] and loading the user's preferences,
  /// - initializing riverpod's [ProviderScope], and
  /// - running the app with [runApp].
  Future<void> bootstrap(
    void Function(Widget app) runApp,
    Future<SharedPreferences> Function() getSharedPreferences,
  ) async {
    // Don't use hash style routes.
    usePathUrlStrategy();

    // Reset notification bar on Android.
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );

    // Load the user's preferences.
    final prefs = await getSharedPreferences();
    final initialSettings = await loadSettings(prefs);

    // Run the app.
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          initialSettingsProvider.overrideWithValue(initialSettings),
        ],
        child: RestorationScope(
          restorationId: 'root',
          child: this,
        ),
      ),
    );
  }
}
