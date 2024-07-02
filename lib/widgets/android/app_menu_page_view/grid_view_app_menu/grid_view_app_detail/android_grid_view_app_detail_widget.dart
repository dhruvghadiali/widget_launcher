import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/models/installed_application.dart';

class AndroidGridViewAppDetailWidget extends StatefulWidget {
  const AndroidGridViewAppDetailWidget({
    super.key,
    required this.application,
  });

  final InstalledApplication application;

  @override
  State<AndroidGridViewAppDetailWidget> createState() =>
      _AndroidGridViewAppDetailWidgetState();
}

class _AndroidGridViewAppDetailWidgetState
    extends State<AndroidGridViewAppDetailWidget> {
  late Uint8List imageBytes;

  @override
  void initState() {
    super.initState();
    imageBytes = base64
        .decode(widget.application.appIconBase64.replaceAll(RegExp(r'\s'), ''));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Open New App");
      },
      onLongPress: () {
        print("Open Custom Options");
      },
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: widget.application.luncherIcon.isEmpty
                  ? imageBytes.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            imageBytes,
                            width: 40,
                            height: 40,
                          ),
                        )
                      : Container()
                  : Image.asset(
                      'assets/images/${MediaQuery.of(context).platformBrightness == Brightness.dark ? 'dark_theme' : 'light_theme'}/${widget.application.luncherIcon}.png',
                      width: 30,
                      height: 30,
                      // color: Theme.of(context).colorScheme.secondary, =========== Set Color based on theme and based on app is locked or not ============
                    ),
            ),
            Text(
              widget.application.applicationName,
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
