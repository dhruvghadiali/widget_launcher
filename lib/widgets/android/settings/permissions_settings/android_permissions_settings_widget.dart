import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile/android_settings_extension_tile_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile_text_button/android_extension_tile_text_button_widget.dart';

class AndroidPermissionsSettingsWidget extends StatelessWidget {
  const AndroidPermissionsSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidSettingsExtensionTileWidget(
      title: 'Permission',
      subtitle:
          'You can manage and control app permissions, ensuring that applications only access necessary data and features. ',
      children: [
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Notification',
          icon: Icons.check_circle,
        ),
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Contacts',
          icon: Icons.check_circle,
        ),
        AndroidExtensionTileTextButtonWidget(
          onPressed: () {},
          title: 'Messages',
          icon: Icons.circle_outlined,
        ),
      ],
    );
  }
}
