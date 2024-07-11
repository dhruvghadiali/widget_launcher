import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/conversion_controller.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/message_notification/android_message_notification_widget.dart';

class AndroidMessageNotificationPageViewWidget extends StatefulWidget {
  const AndroidMessageNotificationPageViewWidget({super.key});

  @override
  State<AndroidMessageNotificationPageViewWidget> createState() =>
      _AndroidMessageNotificationPageViewWidgetState();
}

class _AndroidMessageNotificationPageViewWidgetState
    extends State<AndroidMessageNotificationPageViewWidget> {
  ConversionController conversionController = Get.put(ConversionController());
  @override
  void initState() {
    super.initState();
    conversionController.redTextMessages();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversionController>(
        builder: (conversionControllerContext) {
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
                  'Conversion',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              Expanded(
                child: conversionControllerContext.showLoader
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    : ListView.builder(
                        itemCount:
                            conversionControllerContext.textMessages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AndroidMessageNotificationWidget(
                            textMessageProvider:
                                conversionControllerContext.textMessages[index],
                          );
                        },
                      ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ActionChip(
                      onPressed: () {},
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      avatar: Icon(
                        Icons.message,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        "Message",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
