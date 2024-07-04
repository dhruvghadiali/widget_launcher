import 'package:flutter/material.dart';

class AndroidAppDrawerAppWidget extends StatelessWidget {
  const AndroidAppDrawerAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
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
      ),
    );
  }
}
