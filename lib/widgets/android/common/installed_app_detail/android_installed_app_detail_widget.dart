import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/utils/utility.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_detail/installed_app_detail_icon/android_installed_app_detail_icon_widget.dart';

class AndroidInstalledAppDetailWidget extends StatelessWidget {
  const AndroidInstalledAppDetailWidget({
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AndroidInstalledAppDetailIconWidget(
                imageBytes: Utility.converToUnit8List(
                  installedApplication.appIconBase64,
                ),
                luncherIcon: installedApplication.luncherIcon,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  installedApplication.applicationName,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              )
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            indent: 70,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
