import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/dark_theme.dart';
import 'package:widget_launcher/theme/light_theme.dart';
import 'package:widget_launcher/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Launcher',
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      home: const DashboardScreen(),
    );
  }
}