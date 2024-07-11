import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/conversation_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/text_message_chat/android_text_message_chat_widget.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: GetBuilder<ConversationController>(
          builder: (conversationControllerContext) {
            switch (conversationControllerContext.activeConversationIndex) {
              case 0:
                return Container();
              case 1:
                return const AndroidTextMessageChatWidget();
              case 2:
                return Container();
              case 3:
                return Container();
              case 4:
                return Container();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
