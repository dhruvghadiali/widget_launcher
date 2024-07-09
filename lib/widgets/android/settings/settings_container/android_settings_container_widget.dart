import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/settings_card/android_settings_card_widget.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/android_drawer_settings_widget.dart';
import 'package:widget_launcher/widgets/android/settings/general_settings/android_general_settings_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_divider/android_settings_divider_widget.dart';
import 'package:widget_launcher/widgets/android/settings/permissions_settings/android_permissions_settings_widget.dart';

class AndroidSettingsContainerWidget extends StatelessWidget {
  const AndroidSettingsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Column(
            children: [
              AndroidSettingsCardWidget(
                children: [
                  AndroidGeneralSettingsWidget(),
                  AndroidSettingsDividerWidget(),
                  AndroidDrawerSettingsWidget(),
                ],
              ),
              AndroidSettingsCardWidget(
                children: [
                  AndroidPermissionsSettingsWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
