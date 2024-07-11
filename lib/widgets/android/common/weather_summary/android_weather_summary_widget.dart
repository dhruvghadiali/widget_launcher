import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidAppMenuWeatherSummaryWidget extends StatelessWidget {
  const AndroidAppMenuWeatherSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            '01 AM',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context)
                      .extension<ExtensionsThemeData>()!
                      .warning,
                ),
          ),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/01d.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 5,),
          Text(
            '27°C',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }
}
