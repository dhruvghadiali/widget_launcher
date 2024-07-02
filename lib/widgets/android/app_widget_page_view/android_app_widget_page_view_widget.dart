import 'package:flutter/material.dart';

class AndroidAppWidgetPageViewWidget extends StatelessWidget {
  const AndroidAppWidgetPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Text(
          'Display mobile app widgets',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
