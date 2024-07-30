import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/settings/application/settings_service.dart';
import '../l10n/l10n.dart';
import '../utils/design.dart';
import '../utils/router.dart';
import 'bootstrap.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerStatefulWidget with Bootstrap {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with RestorationMixin {
  @override
  String get restorationId => 'wrapper';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // The router manages its own restoration state.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (context) => context.l10n.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: theme,
      darkTheme: darkTheme,

      // Glue the SettingsService to the MaterialApp.
      //
      // The Riverpod ref provides reactive primitives.
      // This code watches the SettingsService for changes.
      // Whenever the user updates their settings, this causes the MaterialApp to rebuild.
      themeMode: ref.watch(settingsServiceProvider).themeMode,

      // Routing is done via the GoRouter package.
      routerConfig: ref.read(routerProvider).config(),
    );
  }
}
