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

  static String setName(Map<String, dynamic> json) => '';
}
