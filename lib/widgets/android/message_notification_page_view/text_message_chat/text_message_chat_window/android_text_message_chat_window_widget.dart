import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/text_message.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidTextMessageChatWindowWidget extends StatelessWidget {
  const AndroidTextMessageChatWindowWidget({
    super.key,
    required this.messages,
  });

  final List<TextMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 20,
          right: 15,
          left: 15,
        ),
        child: ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: messages[index].type == 2
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE, dd MMMM yyyy ')
                        .format(messages[index].date)
                        .toString(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .extension<ExtensionsThemeData>()!
                            .warning),
                  ),
                  Text(
                    DateFormat('hh:mm a')
                        .format(messages[index].date)
                        .toString(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .extension<ExtensionsThemeData>()!
                            .warning),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    messages[index].message,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  messages[index].read == 1
                      ? Icon(
                          Icons.done_all,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: 15,
                        )
                      : Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: 15,
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
