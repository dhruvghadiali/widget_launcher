import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidAppMenuHeaderPopupItemWidget extends StatelessWidget {
  const AndroidAppMenuHeaderPopupItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
  });

  final String title;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isActive
              ? Theme.of(context).extension<ExtensionsThemeData>()!.light
              : Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isActive
                      ? Theme.of(context)
                          .extension<ExtensionsThemeData>()!
                          .light
                      : Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }
}
