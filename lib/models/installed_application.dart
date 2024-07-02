class InstalledApplication {
  String applicationName;
  String packageName;
  String applicationSourceDir;
  String appIconBase64;
  String luncherIcon;
  bool installedFromPlayStore;
  bool installedFromDeviceManufacturer;
  bool isLaunchable;

  InstalledApplication({
    required this.applicationName,
    required this.packageName,
    required this.applicationSourceDir,
    required this.appIconBase64,
    required this.luncherIcon,
    required this.installedFromPlayStore,
    required this.installedFromDeviceManufacturer,
    required this.isLaunchable,
  });

  factory InstalledApplication.fromJson(Map<String, dynamic> json) {
    return InstalledApplication(
      applicationName: setApplicationName(json),
      packageName: setPackageName(json),
      applicationSourceDir: setApplicationSourceDir(json),
      appIconBase64: setAppIconBase64(json),
      luncherIcon: setLuncherIcon(json),
      installedFromPlayStore: setInstalledFromPlayStore(json),
      installedFromDeviceManufacturer: setInstalledFromDeviceManufacturer(json),
      isLaunchable: setIsLaunchable(json),
    );
  }

  InstalledApplication copyWith(
          {String? applicationName,
          String? packageName,
          String? applicationSourceDir,
          String? appIconBase64,
          String? luncherIcon,
          bool? installedFromPlayStore,
          bool? installedFromDeviceManufacturer,
          bool? isLaunchable}) =>
      InstalledApplication(
        applicationName: applicationName ?? this.applicationName,
        packageName: packageName ?? this.packageName,
        applicationSourceDir: applicationSourceDir ?? this.applicationSourceDir,
        appIconBase64: appIconBase64 ?? this.appIconBase64,
        luncherIcon: luncherIcon ?? this.luncherIcon,
        installedFromPlayStore:
            installedFromPlayStore ?? this.installedFromPlayStore,
        installedFromDeviceManufacturer: installedFromDeviceManufacturer ??
            this.installedFromDeviceManufacturer,
        isLaunchable: isLaunchable ?? this.isLaunchable,
      );

  static InstalledApplication defaultValues() => InstalledApplication(
        applicationName: '',
        packageName: '',
        applicationSourceDir: '',
        appIconBase64: '',
        luncherIcon: '',
        installedFromPlayStore: false,
        installedFromDeviceManufacturer: false,
        isLaunchable: false,
      );

  static String setApplicationName(Map<String, dynamic> json) {
    if (json.containsKey('appName')) {
      if (json['appName'] != null &&
          json['appName'] is String &&
          json['appName'].toString().isNotEmpty) {
        return json['appName'];
      }
    }

    return '';
  }

  static String setPackageName(Map<String, dynamic> json) {
    if (json.containsKey('packageName')) {
      if (json['packageName'] != null &&
          json['packageName'] is String &&
          json['packageName'].toString().isNotEmpty) {
        return json['packageName'];
      }
    }

    return '';
  }

  static String setApplicationSourceDir(Map<String, dynamic> json) {
    if (json.containsKey('source')) {
      if (json['source'] != null &&
          json['source'] is String &&
          json['source'].toString().isNotEmpty) {
        return json['source'];
      }
    }

    return '';
  }

  static String setAppIconBase64(Map<String, dynamic> json) {
    if (json.containsKey('iconBase64')) {
      if (json['iconBase64'] != null &&
          json['iconBase64'] is String &&
          json['iconBase64'].toString().isNotEmpty) {
        return json['iconBase64'];
      }
    }

    return '';
  }

  static bool setInstalledFromPlayStore(Map<String, dynamic> json) {
    if (json.containsKey('installedFromPlayStore')) {
      if (json['installedFromPlayStore'] != null &&
          json['installedFromPlayStore'] is String &&
          json['installedFromPlayStore'].toString().isNotEmpty) {
        return json['installedFromPlayStore'] == 'true' ? true : false;
      }
    }

    return false;
  }

  static bool setInstalledFromDeviceManufacturer(Map<String, dynamic> json) {
    if (json.containsKey('installedFromDeviceManufacturer')) {
      if (json['installedFromDeviceManufacturer'] != null &&
          json['installedFromDeviceManufacturer'] is String &&
          json['installedFromDeviceManufacturer'].toString().isNotEmpty) {
        return json['installedFromDeviceManufacturer'] == 'true' ? true : false;
      }
    }

    return false;
  }

  static bool setIsLaunchable(Map<String, dynamic> json) {
    if (json.containsKey('isLaunchable')) {
      if (json['isLaunchable'] != null &&
          json['isLaunchable'] is String &&
          json['isLaunchable'].toString().isNotEmpty) {
        return json['isLaunchable'] == 'true' ? true : false;
      }
    }

    return false;
  }

  static String setLuncherIcon(Map<String, dynamic> json) {
    if (json.containsKey('appName')) {
      if (json['appName'] != null &&
          json['appName'] is String &&
          json['appName'].toString().isNotEmpty) {
        print("appName ${json['appName']}");
        switch (json['appName'].toString().toLowerCase()) {
          case 'adobe acrobat':
            return 'adobe_acrobat';
          case 'albums':
            return 'albums';
          case 'calculator':
            return 'calculator';
          case 'calendar':
            return 'calendar';
          case 'camera':
            return 'camera';
          case 'chrome':
            return 'chrome';
          case 'clock':
            return 'clock';
          default:
            return '';
        }
      }
    }

    return '';
  }
}
