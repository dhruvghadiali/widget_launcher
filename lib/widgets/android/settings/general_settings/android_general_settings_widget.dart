import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile/android_settings_extension_tile_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile_text_button/android_extension_tile_text_button_widget.dart';

class AndroidGeneralSettingsWidget extends StatelessWidget {
  const AndroidGeneralSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidSettingsExtensionTileWidget(
      title: 'General',
      subtitle:
          'Central hub for managing basic settings and adjust essential options to personalize configurations',
      children: [
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Reset settings',
          icon: Icons.restart_alt_rounded,
        ),
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Message',
          icon: Icons.message,
        ),
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Theme',
          icon: Icons.color_lens_rounded,
          subtitle: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? 'Dark'
              : 'Light',
        ),
      ],
    );
  }
}
