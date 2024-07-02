import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/widgets/android/greeting_message/android_greeting_message_widget.dart';

class AndroidAppMenuHeaderWidget extends StatelessWidget {
  const AndroidAppMenuHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      alignment: Alignment.bottomLeft,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Display Current location name, weather & temperature
            // Container(
            //   height: 100,
            //   color: Colors.white,
            //   margin: const EdgeInsets.only(bottom: 10),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Dhruv',
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Theme.of(context)
                                      .extension<ExtensionsThemeData>()!
                                      .warning,
                                ),
                      ),
                      const AndroidGreetingMessage()
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list_rounded),
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
