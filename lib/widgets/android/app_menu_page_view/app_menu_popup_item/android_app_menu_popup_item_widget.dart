import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidAppMenuPopupItemWidget extends StatelessWidget {
  const AndroidAppMenuPopupItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final int index;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () => onPressed(),
      pressElevation: 10,
      elevation: 2,
      shadowColor: Theme.of(context).extension<ExtensionsThemeData>()!.warning,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      avatar: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
