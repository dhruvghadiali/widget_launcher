class TextMessage {
  String id;
  String contactName;
  String message;
  int read;
  int type;
  DateTime date;

  TextMessage({
    required this.id,
    required this.contactName,
    required this.message,
    required this.read,
    required this.type,
    required this.date,
  });

  factory TextMessage.fromJson(Map<String, dynamic> json) {
    return TextMessage(
      id: setId(json),
      contactName: setContactName(json),
      message: setMessage(json),
      read: setRead(json),
      type: setType(json),
      date: setDate(json),
    );
  }

  TextMessage copyWith({
    String? id,
    String? contactName,
    String? message,
    int? read,
    int? type,
    DateTime? date,
  }) =>
      TextMessage(
        id: id ?? this.id,
        contactName: contactName ?? this.contactName,
        message: message ?? this.message,
        read: read ?? this.read,
        type: type ?? this.type,
        date: date ?? this.date,
      );

  static TextMessage defaultValues() => TextMessage(
        id: '',
        contactName: '',
        message: '',
        read: 1,
        type: 1,
        date: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'contactName': contactName,
        'message': message,
        'date': date,
        'read': read,
        'type': type,
      };

  static String setId(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      if (json['id'] != null &&
          json['id'] is String &&
          json['id'].toString().isNotEmpty) {
        return json['id'];
      }
    }

    return '';
  }

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
        return DateTime.parse(json['date']);
      }
    }

    return DateTime.now();
  }
}
