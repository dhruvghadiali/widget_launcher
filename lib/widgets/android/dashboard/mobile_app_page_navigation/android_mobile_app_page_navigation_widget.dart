import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidMobileAppPageNavigationWidget extends StatelessWidget {
  const AndroidMobileAppPageNavigationWidget({
    super.key,
    required this.icon,
    required this.onNavigationPressed,
  });

  final IconData icon;
  final Function onNavigationPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 15, left: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).extension<ExtensionsThemeData>()!.success,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () => onNavigationPressed(),
                icon: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                iconSize: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
