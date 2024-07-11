import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/conversion_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/chat/chat_header/android_chat_header_widget.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/chat/chat_window/android_chat_window_widget.dart';

class AndroidChatWidget extends StatelessWidget {
  const AndroidChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversionController>(
      builder: (conversionControllerContext) {
        return SafeArea(
          child: Column(
            children: [
              AndroidChatHeader(
                contactName: conversionControllerContext
                    .selectedTextMessages.messages[0].contactName,
                conversionIcon: 'gmail',
              ),
              AndroidChatWindowWidget(
                messages:
                    conversionControllerContext.selectedTextMessages.messages,
              )
            ],
          ),
        );
      },
    );
  }
}
