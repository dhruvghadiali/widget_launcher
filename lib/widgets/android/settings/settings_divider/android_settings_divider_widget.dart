import 'package:flutter/material.dart';

class AndroidSettingsDividerWidget extends StatelessWidget {
  const AndroidSettingsDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
