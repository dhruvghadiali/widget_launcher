import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidEmptyDrawerList extends StatelessWidget {
  const AndroidEmptyDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Icon(
            Icons.error,
            color: Theme.of(context).extension<ExtensionsThemeData>()!.warning,
            size: 50,
          ),
        ),
        Center(
          child: Text(
            'Please create your drawer list from settings',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
      ],
    );
  }
}
