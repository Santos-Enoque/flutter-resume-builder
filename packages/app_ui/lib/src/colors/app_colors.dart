import 'package:flutter/material.dart';

/// Defines the color palette for the App UI in both light and dark themes.
class AppColors {
  //////////////////////////////////////////////////////////////////////////////
  //                             Common colors                                 //
  //////////////////////////////////////////////////////////////////////////////
  /// Black color, generally used for text and icons.
  static const Color black = Colors.black;

  /// Transparent color, used for invisible elements or to create transparency.
  static const Color transparent = Colors.transparent;

  /// White color, often used for background and text in light theme.
  static const Color white = Colors.white;

  /// Red Wine color, a deep, rich red. Often used for error messages
  /// and critical elements.
  static const Color redWine = Color(0xFF9A031E);

  //////////////////////////////////////////////////////////////////////////////
  //                             Light Theme Colors                           //
  //////////////////////////////////////////////////////////////////////////////
  /// Primary color for the light theme.
  static const Color primaryLight = Color(0xFF2550FF);

  /// Color for text and icons on top of the primary color for the light theme.
  static const Color onPrimaryLight = Colors.white;

  /// Secondary color for the light theme.
  static const Color secondaryLight = Color(0xFFffd425);

  /// Color for text and icons on top of the secondary color for the
  /// light theme.
  static const Color onSecondaryLight = Colors.black;

  /// Background color for the light theme.
  static const Color backgroundLight = Color(0xFFF8F8F8);

  /// Color for text and icons on top of the background color for the
  /// light theme.
  static const Color onBackgroundLight = Colors.black;

  /// Surface color for the light theme.
  static const Color surfaceLight = Colors.white;

  /// Color for text and icons on top of the surface color for the light theme.
  static const Color onSurfaceLight = Colors.black;

  /// Error color for the light theme.
  static const Color errorLight = Colors.red;

  /// Color for text and icons on top of the error color for the light theme.
  static const Color onErrorLight = Colors.white;

  //////////////////////////////////////////////////////////////////////////////
  //                             Dark Theme Colors                            //
  //////////////////////////////////////////////////////////////////////////////
  /// Primary color for the dark theme.
  static const Color primaryDark = Color(0xFF2589ff);

  /// Color for text and icons on top of the primary color for the dark theme.
  static const Color onPrimaryDark = Colors.white;

  /// Secondary color for the dark theme.
  static const Color secondaryDark = Color(0xFFff9b25);

  /// Color for text and icons on top of the secondary color for the dark theme.
  static const Color onSecondaryDark = Colors.white;

  /// Background color for the dark theme.
  static const Color backgroundDark = Color(0xFF2D2F32);

  /// Color for text and icons on top of the background color for the
  ///  dark theme.
  static const Color onBackgroundDark = Colors.white;

  /// Surface color for the dark theme.
  static const Color surfaceDark = Color(0xFF141418);

  /// Color for text and icons on top of the surface color for the dark theme.
  static const Color onSurfaceDark = Colors.white;

  /// Error color for the dark theme.
  static const Color errorDark = Colors.red;

  /// Color for text and icons on top of the error color for the dark theme.
  static const Color onErrorDark = Colors.white;

  // Disabled colors
  /// Foreground color for disabled elements.
  static const Color disabledForeground = Color(0x611B1B1B);

  /// Background color for disabled buttons.
  static const Color disabledButton = Color(0x1F000000);
}
