import 'package:widget_launcher/models/text_message.dart';

class TextMessageProvider {
  String messageProvider;
  List<TextMessage> messages;

  TextMessageProvider({
    required this.messageProvider,
    required this.messages,
  });

  factory TextMessageProvider.fromJson(Map<String, dynamic> json) {
    return TextMessageProvider(
      messageProvider: setMessageProvider(json),
      messages: setMessages(json),
    );
  }

  TextMessageProvider copyWith({
    String? messageProvider,
    List<TextMessage>? messages,
  }) =>
      TextMessageProvider(
        messageProvider: messageProvider ?? this.messageProvider,
        messages: messages ?? this.messages,
      );

  static TextMessageProvider defaultValues() => TextMessageProvider(
        messageProvider: '',
        messages: [],
      );

  static String setMessageProvider(Map<String, dynamic> json) {
    if (json.containsKey('messageProvider')) {
      if (json['messageProvider'] != null &&
          json['messageProvider'] is String &&
          json['messageProvider'].toString().isNotEmpty) {
        return json['messageProvider'];
      }
    }

    return '';
  }

  static List<TextMessage> setMessages(Map<String, dynamic> json) {
    if (json.containsKey('messages')) {
      if (json['messages'] != null &&
          json['messages'] is List &&
          json['messages'].length > 0) {
        List<TextMessage> textMessages = [];
        for (var messageJson in json['messages']) {
          final TextMessage textMessage = TextMessage.fromJson(messageJson);
          textMessages.add(textMessage);
        }

        return textMessages;
      }
    }

    return [];
  }
}
