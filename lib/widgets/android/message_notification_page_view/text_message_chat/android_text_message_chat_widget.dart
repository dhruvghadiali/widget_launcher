import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/conversation_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/text_message_chat/text_message_chat_header/android_text_message_chat_header_widget.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/text_message_chat/text_message_chat_window/android_text_message_chat_window_widget.dart';

class AndroidTextMessageChatWidget extends StatelessWidget {
  const AndroidTextMessageChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
      builder: (conversationControllerContext) {
        return SafeArea(
          child: Column(
            children: [
              AndroidTextMessageChatHeaderWidget(
                contactName: conversationControllerContext
                    .selectedTextMessages.messages[0].contactName,
                conversionIcon: 'messages',
              ),
              AndroidTextMessageChatWindowWidget(
                messages:
                    conversationControllerContext.selectedTextMessages.messages,
              )
            ],
          ),
        );
      },
    );
  }
}
