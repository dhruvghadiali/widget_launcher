import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidConversationAppWidget extends StatelessWidget {
  const AndroidConversationAppWidget({
    super.key,
    required this.isActive,
    required this.name,
    required this.imageName,
    required this.onPressed,
  });

  final bool isActive;
  final String name;
  final String imageName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ActionChip(
        onPressed: () => onPressed(),
        backgroundColor: isActive
            ? Theme.of(context).extension<ExtensionsThemeData>()!.warning
            : Theme.of(context).colorScheme.secondary,
        avatar: Image.asset(
          "assets/images/$imageName.png",
          width: 13,
          height: 13,
        ),
        label: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
