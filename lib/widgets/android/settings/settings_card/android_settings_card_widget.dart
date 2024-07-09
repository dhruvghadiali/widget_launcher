import 'package:flutter/material.dart';

class AndroidSettingsCardWidget extends StatelessWidget {
  const AndroidSettingsCardWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      color: Theme.of(context).colorScheme.surface,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
