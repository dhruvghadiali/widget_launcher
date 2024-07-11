import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/models/text_message_provider.dart';
import 'package:widget_launcher/controllers/conversation_controller.dart';

class AndroidMessageNotificationWidget extends StatelessWidget {
  const AndroidMessageNotificationWidget({
    super.key,
    required this.textMessageProvider,
  });

  final TextMessageProvider textMessageProvider;

  void onTap(BuildContext context) {
    ConversationController conversationController = Get.put(ConversationController());
    conversationController.setTextMessages(textMessageProvider);
    Navigator.pushNamed(context, '/conversion');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: const Icon(
                    Icons.person_2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    textMessageProvider.messages[0].contactName,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                textMessageProvider.messages[0].read == 0
                    ? Icon(
                        Icons.circle,
                        size: 10,
                        color: Theme.of(context)
                            .extension<ExtensionsThemeData>()!
                            .warning,
                      )
                    : Container(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                textMessageProvider.messages[0].message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context)
                          .extension<ExtensionsThemeData>()!
                          .light,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
