import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/app_palette.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      surface: DarkThemeColors.colorBlack,
      onSurface: DarkThemeColors.colorBlack,
      primary: DarkThemeColors.colorDarkSlateGray,
      onPrimary: DarkThemeColors.colorDarkSlateGray,
      secondary: DarkThemeColors.colorWhite,
      onSecondary: DarkThemeColors.colorWhite,
      tertiary:  DarkThemeColors.colorGrey,
      error: DarkThemeColors.colorCherryBomb,
      onError: DarkThemeColors.colorCherryBomb,
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
      bodyColor: DarkThemeColors.colorWhite,
    ),
    extensions: [
      ExtensionsThemeData(
        info: DarkThemeColors.colorBattleshipGrey,
        warning: DarkThemeColors.colorKhaki,
        success: DarkThemeColors.colorNightWatch,
        dark: DarkThemeColors.colorDarkVoid,
        light: DarkThemeColors.colorPlatinum,
      ),
    ],
  );
}
