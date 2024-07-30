import 'package:flutter/material.dart';

/// The app's color scheme.
final ColorScheme scheme = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple.shade300,
);

/// The app's dark color scheme.
final ColorScheme darkScheme = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple.shade700,
  brightness: Brightness.dark,
);

/// The app's theme.
final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: scheme,
);

/// The app's dark theme.
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkScheme,
);
