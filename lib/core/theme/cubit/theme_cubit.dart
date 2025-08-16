import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../dark_theme.dart';
import '../light_theme.dart';
import 'theme_states.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeState(
          applightTheme: lightTheme,
          appdarkTheme: darkTheme,
          themeMode: ThemeMode.system,
        ),
      );

  void toggleTheme() {
    if (state.themeMode == ThemeMode.light) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }

  void setTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
