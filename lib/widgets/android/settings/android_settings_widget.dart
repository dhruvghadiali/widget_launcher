import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/settings/settings_container/android_settings_container_widget.dart';

class AndroidSettingsWidget extends StatelessWidget {
  const AndroidSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            child: Image.asset(
              'assets/images/left_arrow.png',
              width: 30,
              height: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          const AndroidSettingsContainerWidget(),
        ],
      ),
    );
  }
}
