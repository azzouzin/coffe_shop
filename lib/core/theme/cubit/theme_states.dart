import 'package:flutter/material.dart';

import '../dark_theme.dart';
import '../light_theme.dart';

class ThemeState {
  final ThemeData applightTheme;
  final ThemeData appdarkTheme;
  final ThemeMode themeMode;

  ThemeState({
    required this.applightTheme,
    required this.appdarkTheme,
    required this.themeMode,
  });

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(
      applightTheme: applightTheme,
      appdarkTheme: appdarkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  // ✅ Convert state to JSON
  Map<String, dynamic> toMap() {
    return {'themeMode': themeMode.toString()};
  }

  // ✅ Restore state from JSON
  factory ThemeState.fromMap(Map<String, dynamic> map) {
    ThemeMode mode = ThemeMode.system;
    if (map['themeMode'] == ThemeMode.light.toString()) {
      mode = ThemeMode.light;
    } else if (map['themeMode'] == ThemeMode.dark.toString()) {
      mode = ThemeMode.dark;
    }
    return ThemeState(
      appdarkTheme: lightTheme,
      applightTheme: darkTheme,
      themeMode: mode,
    );
  }
}
