import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/conversation_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/conversation_app/android_conversation_app_widget.dart';

class AndroidConversationAppsWidget extends StatelessWidget {
  const AndroidConversationAppsWidget({super.key});

  void onPressed({required int activeIndex}) {
    ConversationController conversationController =
        Get.put(ConversationController());
    conversationController.setActiveConversationIndex(activeIndex);

    switch (activeIndex) {
      case 0:
        break;
      case 1:
        conversationController.redTextMessages();
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
      builder: (conversationControllerContext) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AndroidConversationAppWidget(
                  isActive:
                      conversationControllerContext.activeConversationIndex == 0
                          ? true
                          : false,
                  imageName: 'phone',
                  name: 'Calls',
                  onPressed: () => onPressed(activeIndex: 0),
                ),
                AndroidConversationAppWidget(
                  isActive:
                      conversationControllerContext.activeConversationIndex == 1
                          ? true
                          : false,
                  imageName: 'messages',
                  name: 'Messages',
                  onPressed: () => onPressed(activeIndex: 1),
                ),
                AndroidConversationAppWidget(
                  isActive:
                      conversationControllerContext.activeConversationIndex == 2
                          ? true
                          : false,
                  imageName: 'whatsapp',
                  name: 'WhatsApp',
                  onPressed: () => onPressed(activeIndex: 2),
                ),
                AndroidConversationAppWidget(
                  isActive:
                      conversationControllerContext.activeConversationIndex == 3
                          ? true
                          : false,
                  imageName: 'gmail',
                  name: 'Gmail',
                  onPressed: () => onPressed(activeIndex: 3),
                ),
                AndroidConversationAppWidget(
                  isActive:
                      conversationControllerContext.activeConversationIndex == 4
                          ? true
                          : false,
                  imageName: 'outlook',
                  name: 'Outlook',
                  onPressed: () => onPressed(activeIndex: 4),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
