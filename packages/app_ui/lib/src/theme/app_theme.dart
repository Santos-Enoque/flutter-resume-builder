import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      colorScheme: _colorScheme,
    );
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.light().copyWith(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      background: AppColors.backgroundLight,
      onBackground: AppColors.onBackgroundLight,
      error: AppColors.errorLight,
      onError: AppColors.onErrorLight,
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      elevation: 1,
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.black,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.black,
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.primaryDark,
      prefixIconColor: AppColors.primaryDark,
      hoverColor: AppColors.primaryDark,
      focusColor: AppColors.primaryDark,
      fillColor: AppColors.backgroundLight,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      errorBorder: _textFieldErrorBorder,
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const UnderlineInputBorder(),
      filled: true,
      isDense: true,
    );
  }

  InputBorder get _textFieldBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.primaryLight,
        ),
      );

  InputBorder get _textFieldErrorBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.redWine,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      ),
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.primaryLight,
      backgroundColor: AppColors.secondaryLight,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }
}

/// {@template app_theme_dark}
/// The Dark Mode App [ThemeData].
/// {@endtemplate}
class AppThemeDark {
  /// {@macro app_theme_dark}
  const AppThemeDark();

  /// Dark `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      colorScheme: _colorScheme,
    );
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      background: AppColors.backgroundDark,
      onBackground: AppColors.onBackgroundDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      elevation: 1,
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.white,
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.primaryLight,
      prefixIconColor: AppColors.primaryLight,
      hoverColor: AppColors.primaryLight,
      focusColor: AppColors.primaryLight,
      fillColor: AppColors.backgroundDark,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      errorBorder: _textFieldErrorBorder,
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const UnderlineInputBorder(),
      filled: true,
      isDense: true,
    );
  }

  InputBorder get _textFieldBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.primaryDark,
        ),
      );

  InputBorder get _textFieldErrorBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.redWine,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      ),
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.primaryDark,
      backgroundColor: AppColors.secondaryDark,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }
}
