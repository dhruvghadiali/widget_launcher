import 'package:flutter/material.dart';

class AndroidAppDrawerPageViewWidget extends StatelessWidget {
  const AndroidAppDrawerPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        height: 2500,
        child: Text(
          'Display app drawer',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
