import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/app_palette.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      surface: LightThemeColors.colorWhite,
      onSurface: LightThemeColors.colorWhite,
      primary: LightThemeColors.colorPlatinum,
      onPrimary: LightThemeColors.colorPlatinum,
      secondary: LightThemeColors.colorBlack,
      onSecondary: LightThemeColors.colorBlack,
      tertiary:  DarkThemeColors.colorBattleshipGrey,
      error: LightThemeColors.colorDarkSlateGray,
      onError: LightThemeColors.colorDarkSlateGray,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
      displayLarge: TextStyle(),
      displayMedium: TextStyle(),
      displaySmall: TextStyle(),
      headlineLarge: TextStyle(),
      headlineMedium: TextStyle(),
      headlineSmall: TextStyle(),
      labelLarge: TextStyle(),
      labelMedium: TextStyle(),
      labelSmall: TextStyle(),
      titleLarge: TextStyle(),
      titleMedium: TextStyle(),
      titleSmall: TextStyle(),
    ).apply(
      bodyColor: LightThemeColors.colorBlack,
    ),
    extensions: [
      ExtensionsThemeData(
        info: LightThemeColors.colorGrey,
        warning: LightThemeColors.colorSandyBrown,
        success: LightThemeColors.colorlightGreen,
        dark: LightThemeColors.colorDarkVoid,
        light: LightThemeColors.colorDarkSlateGray ,
      ),
    ],
  );
}
