import 'package:widget_launcher/models/installed_application.dart';

class DrawerInfo {
  String name;
  List<InstalledApplication> installedApplications;

  DrawerInfo({
    required this.name,
    required this.installedApplications,
  });

  factory DrawerInfo.fromJson(Map<String, dynamic> json) {
    return DrawerInfo(
        name: setName(json),
        installedApplications: setInstalledApplications(json));
  }

  DrawerInfo copyWith(
          {String? name, List<InstalledApplication>? installedApplications}) =>
      DrawerInfo(
        name: name ?? this.name,
        installedApplications:
            installedApplications ?? this.installedApplications,
      );

  static DrawerInfo defaultValues() => DrawerInfo(
        name: '',
        installedApplications: [],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'installedApplications': installedApplications
            .map((installedApplication) => installedApplication.toJson())
            .toList()
      };

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

  static List<InstalledApplication> setInstalledApplications(
      Map<String, dynamic> json) {
    if (json.containsKey('installedApplications')) {
      if (json['installedApplications'] != null &&
          json['installedApplications'].length > 0) {
        List<InstalledApplication> installedApplications = [];
        for (var installedApplicationJson in json['installedApplications']) {
          final InstalledApplication installedApplication =
              InstalledApplication.fromJson(installedApplicationJson);
          installedApplications.add(installedApplication);
        }

        return installedApplications;
      }
    }
    return [];
  }
}
