class TextMessage {
  String contactName;
  String message;
  int read;
  int type;
  DateTime date;

  TextMessage({
    required this.contactName,
    required this.message,
    required this.read,
    required this.type,
    required this.date,
  });

  factory TextMessage.fromJson(Map<String, dynamic> json) {
    return TextMessage(
      contactName: setContactName(json),
      message: setMessage(json),
      read: setRead(json),
      type: setType(json),
      date: setDate(json),
    );
  }

  TextMessage copyWith({
    String? contactName,
    String? message,
    int? read,
    int? type,
    DateTime? date,
  }) =>
      TextMessage(
        contactName: contactName ?? this.contactName,
        message: message ?? this.message,
        read: read ?? this.read,
        type: type ?? this.type,
        date: date ?? this.date,
      );

  static TextMessage defaultValues() => TextMessage(
        contactName: '',
        message: '',
        read: 1,
        type: 1,
        date: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'contactName': contactName,
        'message': message,
        'date': date,
      };

  static String setContactName(Map<String, dynamic> json) {
    if (json.containsKey('contactName')) {
      if (json['contactName'] != null &&
          json['contactName'] is String &&
          json['contactName'].toString().isNotEmpty) {
        return json['contactName'];
      }
    }

    return '';
  }

  static String setMessage(Map<String, dynamic> json) {
    if (json.containsKey('message')) {
      if (json['message'] != null &&
          json['message'] is String &&
          json['message'].toString().isNotEmpty) {
        return json['message'];
      }
    }

    return '';
  }

   static int setRead(Map<String, dynamic> json) {
    if (json.containsKey('read')) {
      if (json['read'] != null &&
          json['read'] is String &&
          json['read'].toString().isNotEmpty) {
        return int.parse(json['read']);
      }
    }

    return 1;
  }

  static int setType(Map<String, dynamic> json) {
    if (json.containsKey('type')) {
      if (json['type'] != null &&
          json['type'] is String &&
          json['type'].toString().isNotEmpty) {
        return int.parse(json['type']);
      }
    }

    return 1;
  }

  static DateTime setDate(Map<String, dynamic> json) {
    if (json.containsKey('date')) {
      if (json['date'] != null &&
          json['date'] is String &&
          json['date'].toString().isNotEmpty) {
        return DateTime.parse(json['date']) ;
      }
    }

    return DateTime.now();
  }
}
