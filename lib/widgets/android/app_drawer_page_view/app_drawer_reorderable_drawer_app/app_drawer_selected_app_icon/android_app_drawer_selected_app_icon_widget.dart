import 'dart:typed_data';
import 'package:flutter/material.dart';

class AndroidAppDrawerSelectedAppIconWidget extends StatelessWidget {
  const AndroidAppDrawerSelectedAppIconWidget({
    super.key,
    required this.luncherIcon,
    required this.imageBytes,
  });

  final String luncherIcon;
  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return luncherIcon.isEmpty
        ? imageBytes.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.memory(
                  imageBytes,
                  width: 25,
                  height: 25,
                ),
              )
            : const Icon(
                Icons.android,
                size: 25,
              )
        : Image.asset(
            'assets/images/$luncherIcon.png',
            width: 25,
            height: 25,
            color: Theme.of(context).colorScheme.secondary,
          );
  }
}
