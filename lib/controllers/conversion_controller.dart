import 'dart:convert';
import 'package:get/get.dart';
import 'package:widget_launcher/models/text_message_provider.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';

class ConversionController extends GetxController {
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
    selectedTextMessages = textMessageProvider;
    update();
  }
}
