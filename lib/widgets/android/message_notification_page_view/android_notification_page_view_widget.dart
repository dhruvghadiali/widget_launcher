import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/conversation_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/conversation_apps/android_conversation_apps_widget.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/text_message_notification/android_text_message_notification_widget.dart';

class AndroidMessageNotificationPageViewWidget extends StatefulWidget {
  const AndroidMessageNotificationPageViewWidget({super.key});

  @override
  State<AndroidMessageNotificationPageViewWidget> createState() =>
      _AndroidMessageNotificationPageViewWidgetState();
}

class _AndroidMessageNotificationPageViewWidgetState
    extends State<AndroidMessageNotificationPageViewWidget> {
  ConversationController conversationController =
      Get.put(ConversationController());

  @override
  void initState() {
    super.initState();
    conversationController.setActiveConversationIndex(0);
  }

  Widget _getConversationBody(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return Container();
      case 1:
        return GetBuilder<ConversationController>(
          builder: (conversationControllerContext) {
            return ListView.builder(
              itemCount: conversationControllerContext.textMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return AndroidMessageNotificationWidget(
                  textMessageProvider:
                      conversationControllerContext.textMessages[index],
                );
              },
            );
          },
        );
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
        builder: (conversationControllerContext) {
      return SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  'Conversations',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              Expanded(
                child: conversationControllerContext.showLoader
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    : _getConversationBody(
                        conversationControllerContext.activeConversationIndex,
                      ),
              ),
              const AndroidConversationAppsWidget(),
            ],
          ),
        ),
      );
    });
  }
}
