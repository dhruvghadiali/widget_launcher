import 'dart:convert';
import 'package:get/get.dart';
import 'package:widget_launcher/models/text_message_provider.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';

class ConversationController extends GetxController {
  int activeConversationIndex = 0;
  bool showLoader = false;
  List<TextMessageProvider> textMessages = [];
  TextMessageProvider selectedTextMessages =
      TextMessageProvider.defaultValues();

  Future<void> redTextMessages() async {
    showLoader = true;
    textMessages = [];
    update();

    try {
      Map<dynamic, dynamic> textMessagesMap =
          await AndroidNativeCodePlugin.getTextMessages();

      final textMessagesString = json.encode(textMessagesMap);
      final textMessagesStringJson = json.decode(textMessagesString);

      textMessagesStringJson.forEach((key, value) {
        final TextMessageProvider textMessageProvider =
            TextMessageProvider.fromJson(
                {'messageProvider': key.toString(), 'messages': value});
        textMessages.add(textMessageProvider);
      });
    } catch (error) {
      print("Error: setInstalledApplications $error");
      textMessages = [];
    }

    showLoader = false;
    update();
  }

  Future<void> setTextMessages(TextMessageProvider textMessageProvider) async {
    // try {
    //   for (var message in textMessageProvider.messages) {
    //     if (message.read == 0) {
    //       await AndroidNativeCodePlugin.textMessagesMarkAsRead(message.id);
    //       message.copyWith(read: 1);
    //     }
    //   }
    // } catch (error) {
    //   print("Error: setTextMessages $error");
    // }

    selectedTextMessages = textMessageProvider;
    update();
  }

  Future<void> setActiveConversationIndex (int index) async {
    activeConversationIndex = index;
    update();
  }
}
