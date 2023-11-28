import 'package:flutter/material.dart';
import 'package:pokedex/src/res/color_scheme/color_scheme.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
      useMaterial3: true,
      colorScheme: ColorSchemes.light,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorSchemes.light.primary,
          foregroundColor: ColorSchemes.light.onPrimary,
          centerTitle: true),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(ColorSchemes.light.primary),
        trackColor:
            MaterialStateProperty.all(ColorSchemes.light.primaryContainer),

        radius: const Radius.circular(8),
        thickness: MaterialStateProperty.all(5),
        interactive: true,
      ));
  static final dark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorSchemes.dark,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorSchemes.dark.primary,
          foregroundColor: ColorSchemes.dark.onPrimary,
          centerTitle: true),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(ColorSchemes.dark.primary),
        trackColor:
            MaterialStateProperty.all(ColorSchemes.dark.primaryContainer),

        radius: const Radius.circular(8),
        thickness: MaterialStateProperty.all(5),
        interactive: true,
      ));
}
