import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidSettingsExtensionTileWidget extends StatelessWidget {
  const AndroidSettingsExtensionTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.enabled,
    this.children,
  });

  final String title;
  final String subtitle;
  final bool? enabled;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      enabled: enabled ?? true,
      iconColor: Theme.of(context).colorScheme.secondary,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.transparent,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color:
                  Theme.of(context).extension<ExtensionsThemeData>()!.warning,
            ),
      ),
      children: children ?? [],
    );
  }
}
