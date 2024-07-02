import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
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
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 3.0,
              offset: Offset(0.0, 0.75)
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: imageBytes.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.memory(
                        imageBytes,
                        width: 40,
                        height: 40,
                      ),
                    )
                  : Container(),
            ),
            Text(
              widget.application.applicationName,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
