import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/chat/android_chat_widget.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: const AndroidChatWidget()),
    );
  }
}
