// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('ThemeCubit', () {
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      // Set up the mocked setBool method to return a Future<bool>
      when(() => mockSharedPreferences.setBool(any(), any()))
          .thenAnswer((_) async => true);
    });

    ThemeCubit buildCubit() => ThemeCubit(prefs: mockSharedPreferences);

    group('constructor', () {
      test('initializes without exceptions', () {
        expect(buildCubit, returnsNormally);
      });

      test('starts with ThemeMode.system as the initial state', () {
        expect(buildCubit().state, ThemeMode.system);
      });
    });

    group('loadThemePreferences', () {
      blocTest<ThemeCubit, ThemeMode>(
        'retrieves the theme mode setting from SharedPreferences',
        build: buildCubit,
        act: (cubit) => cubit.loadThemePreference(),
        verify: (cubit) {
          verify(() => mockSharedPreferences.getBool('isDarkMode')).called(1);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'defaults to system theme when no preference is set in SharedPreferences',
        setUp: () {
          when(() => mockSharedPreferences.getBool('isDarkMode'))
              .thenReturn(null);
        },
        build: buildCubit,
        act: (cubit) => cubit.loadThemePreference(),
        expect: () => [ThemeMode.system],
      );

      blocTest<ThemeCubit, ThemeMode>(
        'loads light theme from SharedPreferences when saved preference is false',
        setUp: () {
          when(() => mockSharedPreferences.getBool('isDarkMode'))
              .thenReturn(false);
        },
        build: buildCubit,
        act: (cubit) => cubit.loadThemePreference(),
        expect: () => [ThemeMode.light],
      );

      blocTest<ThemeCubit, ThemeMode>(
        'loads dark theme from SharedPreferences when saved preference is true',
        setUp: () {
          when(() => mockSharedPreferences.getBool('isDarkMode'))
              .thenReturn(true);
        },
        build: buildCubit,
        act: (cubit) => cubit.loadThemePreference(),
        expect: () => [ThemeMode.dark],
      );
    });

    group('toggleTheme', () {
      blocTest<ThemeCubit, ThemeMode>(
        'persists the selected theme mode to SharedPreferences',
        build: buildCubit,
        act: (cubit) => cubit.toggleTheme(),
        verify: (cubit) {
          verify(() => mockSharedPreferences.setBool(any(), any())).called(1);
        },
      );
      blocTest<ThemeCubit, ThemeMode>(
        'emits [ThemeMode.light] when toggleTheme is called and current theme is dark',
        build: buildCubit,
        seed: () => ThemeMode.dark,
        act: (cubit) => cubit.toggleTheme(),
        expect: () => [ThemeMode.light],
      );

      blocTest<ThemeCubit, ThemeMode>(
        'emits [ThemeMode.dark] when toggleTheme is called and current theme is not dark',
        build: buildCubit,
        seed: () => ThemeMode.light,
        act: (cubit) => cubit.toggleTheme(),
        expect: () => [ThemeMode.dark],
      );
    });
  });
}
