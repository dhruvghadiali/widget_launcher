import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidPanelBottomSheetWidget extends StatelessWidget {
  const AndroidPanelBottomSheetWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.isKeybordInteration = false,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final bool? isKeybordInteration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize:
            isKeybordInteration! ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .extension<ExtensionsThemeData>()!
                        .warning,
                  ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 25, right: 20, left: 20),
            alignment: Alignment.center,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
          Divider(
            color: Theme.of(context).extension<ExtensionsThemeData>()!.warning,
          ),
          isKeybordInteration! ? child : Expanded(child: child),
        ],
      ),
    );
  }
}
