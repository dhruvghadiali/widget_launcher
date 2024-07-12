import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_card/installed_app_icon/android_installed_app_icon_widget.dart';

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AndroidInstalledAppIconWidget(
                  imageBytes: base64.decode(installedApplication.appIconBase64
                      .replaceAll(RegExp(r'\s'), '')),
                  luncherIcon: installedApplication.luncherIcon,
                ),
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
