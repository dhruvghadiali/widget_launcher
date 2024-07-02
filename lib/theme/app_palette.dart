import 'dart:ui';

abstract class DarkThemeColors {
  static Color colorBlack = const Color(0xFF000000); // Surface
  static Color colorDarkSlateGray = const Color(0xFF2C2C2C); // Primary
  static Color colorWhite = const Color(0xFFFFFFFF); // Secondary
  static Color colorGrey = const Color(0xFF777777); // Tertiary
  static Color colorBattleshipGrey= const Color(0xFF7F7F7F); // Info
  static Color colorYellow = const Color(0xFFF9FF00); // Warning
  static Color colorCherryBomb = const Color(0xFFB33A3A); // Danger
  static Color colorNightWatch = const Color(0xFF3B5249); // Success
  static Color colorDarkVoid = const Color(0xFF161616); // Dark
  static Color colorPlatinum = const Color(0xFFE0E0E0); // light
}

abstract class LightThemeColors {
  static Color colorFloralWhite = const Color(0xFFFFFBF5); // Background color
  static Color colorPotBlack = const Color(0xFF0F0F0F); // Foreground color 1
  static Color colorTeal = const Color(0xFF1F6E8C); // Foreground color 2
  static Color colorEnglishRed = const Color(0xFFAE445A); // Error color
  static Color colorBergamotOrange = const Color(0xFFF39F5A);
}
