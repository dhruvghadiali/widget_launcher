import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';

class AppDetailWidget extends StatefulWidget {
  const AppDetailWidget({
    super.key,
    required this.application,
  });

  final InstalledApplication application;

  @override
  State<AppDetailWidget> createState() => _AppDetailWidgetState();
}

class _AppDetailWidgetState extends State<AppDetailWidget> {
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
      onLongPress: (){
        print("Open Custom Options");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: imageBytes.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
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
                  ),
            )
          ],
        ),
      ),
    );
  }
}
