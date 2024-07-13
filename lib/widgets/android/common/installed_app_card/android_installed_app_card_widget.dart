import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/utils/utility.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_card/installed_app_card_icon/android_installed_app_card_icon_widget.dart';

class AndroidInstalledAppCardWidget extends StatelessWidget {
  const AndroidInstalledAppCardWidget({
    super.key,
    required this.installedApplication,
    required this.onLongPressStart,
  });

  final InstalledApplication installedApplication;
  final Function onLongPressStart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await AndroidNativeCodePlugin.openApp(
        installedApplication.packageName,
      ),
      onLongPressStart: (LongPressStartDetails details) =>
          onLongPressStart(details),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AndroidInstalledAppCardIconWidget(
              imageBytes: Utility.converToUnit8List(
                installedApplication.appIconBase64,
              ),
              luncherIcon: installedApplication.luncherIcon,
            ),
            Text(
              installedApplication.applicationName,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
