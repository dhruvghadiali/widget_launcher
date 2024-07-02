import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidGreetingMessage extends StatefulWidget {
  const AndroidGreetingMessage({super.key});

  @override
  State<AndroidGreetingMessage> createState() => _AndroidGreetingMessageState();
}

class _AndroidGreetingMessageState extends State<AndroidGreetingMessage> {
  String message = "";

  @override
  void initState() {
    super.initState();
    int hours = DateTime.now().hour;

    if (hours >= 1 && hours <= 12) {
      message = "good morning !!!";
    } else if (hours >= 12 && hours <= 16) {
      message = "good afternoon !!!";
    } else if (hours >= 16 && hours <= 21) {
      message = "good evening !!!";
    } else if (hours >= 21 && hours <= 24) {
      message = "good night !!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      message.toUpperCase(),
      maxLines: 1,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).extension<ExtensionsThemeData>()!.info,
          ),
    );
  }
}
