import 'dart:typed_data';
import 'package:flutter/material.dart';

class AndroidInstalledAppDetailIconWidget extends StatelessWidget {
  const AndroidInstalledAppDetailIconWidget({
    super.key,
    required this.luncherIcon,
    required this.imageBytes,
  });

  final String luncherIcon;
  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: luncherIcon.isEmpty
          ? imageBytes.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.memory(
                    imageBytes,
                    width: 30,
                    height: 30,
                  ),
                )
              : const Icon(
                  Icons.app_shortcut_outlined,
                  size: 30,
                )
          : Image.asset(
              'assets/images/$luncherIcon.png',
              width: 30,
              height: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
    );
  }
}
