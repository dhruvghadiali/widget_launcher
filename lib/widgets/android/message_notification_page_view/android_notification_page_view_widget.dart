import 'package:flutter/material.dart';

class AndroidMessageNotificationPageViewWidget extends StatelessWidget {
  const AndroidMessageNotificationPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Text(
          'Display mobile message notification',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}