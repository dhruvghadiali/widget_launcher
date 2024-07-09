import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile/android_settings_extension_tile_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile_text_button/android_extension_tile_text_button_widget.dart';

class AndroidDrawerSettingsWidget extends StatelessWidget {
  const AndroidDrawerSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidSettingsExtensionTileWidget(
      title: 'Drawer',
      subtitle:
          'You can categorize and organize their installed applications into custom drawer names',
      children: [
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Add drawer',
          icon: Icons.add_card_sharp,
        ),
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'View drawers',
          icon: Icons.list_rounded,
          subtitle: '5 Drawers',
        )
      ],
    );
  }
}
