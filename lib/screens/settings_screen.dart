import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/android_settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const AndroidSettingsWidget(),
      ),
    );
  }
}
