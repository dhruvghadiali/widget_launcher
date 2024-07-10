import 'dart:typed_data';
import 'package:flutter/material.dart';

class AndroidInstalledAppIconWidget extends StatelessWidget {
  const AndroidInstalledAppIconWidget({
    super.key,
    required this.luncherIcon,
    required this.imageBytes,
  });

  final String luncherIcon;
  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: luncherIcon.isEmpty
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
              'assets/images/$luncherIcon.png',
              width: 30,
              height: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
    );
  }
}
