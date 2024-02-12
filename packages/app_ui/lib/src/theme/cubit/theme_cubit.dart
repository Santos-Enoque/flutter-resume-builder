import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template theme_cubit}
/// A [Cubit] that manages the theme mode of the application.
///
/// It uses [SharedPreferences] to persist the user's theme preference across
/// app launches.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeMode> {
  /// {@macro theme_cubit}
  ThemeCubit({required SharedPreferences prefs})
      : _prefs = prefs,
        super(ThemeMode.system);
  final SharedPreferences _prefs;

  /// Loads the user's theme preference from [SharedPreferences].
  ///
  /// If no preference is found, it defaults to [ThemeMode.system].
  void loadThemePreference() {
    final isDarkMode = _prefs.getBool('isDarkMode');
    emit(
      isDarkMode != null
          ? (isDarkMode ? ThemeMode.dark : ThemeMode.light)
          : ThemeMode.system,
    );
  }

  /// Toggles the current theme mode.
  ///
  /// If the current theme mode is [ThemeMode.dark], it
  /// changes it to [ThemeMode.light].
  /// If the current theme mode is not [ThemeMode.dark],
  /// it changes it to [ThemeMode.dark].
  /// The new theme mode is then saved to [SharedPreferences].
  Future<void> toggleTheme() async {
    if (state == ThemeMode.dark) {
      emit(ThemeMode.light);
      await _prefs.setBool('isDarkMode', false);
    } else {
      emit(ThemeMode.dark);
      await _prefs.setBool('isDarkMode', true);
    }
  }
}
