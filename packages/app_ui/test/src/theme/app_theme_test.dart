// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is AppColors.primaryLight', () {
          expect(
            const AppTheme().themeData.primaryColor,
            AppColors.primaryLight,
          );
        });

        test('secondary is AppColors.secondary', () {
          expect(
            const AppTheme().themeData.colorScheme.secondary,
            AppColors.secondaryLight,
          );
        });
      });

      group('InputDecorationTheme', () {
        test('enabledBorder border color is AppColors.primary', () {
          expect(
            AppTheme().themeData.inputDecorationTheme.enabledBorder,
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.primaryLight,
              ),
            ),
          );
        });

        test('focusedBorder border color is AppColors.primary', () {
          expect(
            AppTheme().themeData.inputDecorationTheme.focusedBorder,
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.primaryLight,
              ),
            ),
          );
        });

        test('enabledBorder border color is AppColors.redWine', () {
          expect(
            AppTheme().themeData.inputDecorationTheme.errorBorder,
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.redWine,
              ),
            ),
          );
        });
      });
    });

    group('AppThemeDark', () {
      group('themeData', () {
        group('color', () {
          test('primary is AppColors.primaryDark', () {
            expect(
              const AppThemeDark().themeData.colorScheme.primary,
              AppColors.primaryDark,
            );
          });

          test('secondary is AppColors.secondary', () {
            expect(
              const AppThemeDark().themeData.colorScheme.secondary,
              AppColors.secondaryDark,
            );
          });

          test('background is AppColors.secondaryDark', () {
            expect(
              const AppThemeDark().themeData.colorScheme.background,
              AppColors.backgroundDark,
            );
          });
        });
      });
    });
  });
}
