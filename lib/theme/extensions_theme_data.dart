import 'package:flutter/material.dart';

class ExtensionsThemeData extends ThemeExtension<ExtensionsThemeData> {
  const ExtensionsThemeData({
    required this.info,
    required this.warning,
    required this.success,
    required this.dark,
    required this.light,
  });

  final Color? info;
  final Color? warning;
  final Color? success;
  final Color? dark;
  final Color? light;

  @override
  ExtensionsThemeData copyWith({
    Color? info,
    Color? warning,
    Color? success,
    Color? dark,
    Color? light,
  }) {
    return ExtensionsThemeData(
      info: info ?? info,
      warning: warning ?? warning,
      success: success ?? success,
      dark: dark ?? dark,
      light: light ?? light,
    );
  }

  @override
  ExtensionsThemeData lerp(
      ThemeExtension<ExtensionsThemeData>? other, double t) {
    if (other is! ExtensionsThemeData) {
      return this;
    }
    return ExtensionsThemeData(
      info: Color.lerp(info, other.info, t),
      warning: Color.lerp(warning, other.warning, t),
      success: Color.lerp(success, other.success, t),
      dark: Color.lerp(dark, other.dark, t),
      light: Color.lerp(light, other.light, t),
    );
  }
}
