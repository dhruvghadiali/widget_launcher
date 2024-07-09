class DrawerInfo {
  String name;

  DrawerInfo({required this.name});

  factory DrawerInfo.fromJson(Map<String, dynamic> json) {
    return DrawerInfo(name: setName(json));
  }

  DrawerInfo copyWith({
    String? name,
  }) =>
      DrawerInfo(name: name ?? this.name);

  static DrawerInfo defaultValues() => DrawerInfo(name: '');

  Map<String, dynamic> toJson() => {'name': name};

  static String setName(Map<String, dynamic> json) {
    if (json.containsKey('name')) {
      if (json['name'] != null &&
          json['name'] is String &&
          json['name'].toString().isNotEmpty) {
        return json['name'];
      }
    }

    return '';
  }
}
