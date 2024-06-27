import 'dart:convert';

import 'package:get/get.dart';
import 'package:widget_launcher/models/installed_application.dart';

class InstalledApplicationController extends GetxController {
  List<InstalledApplication> installedApplications = [];
  List<InstalledApplication> applicationsInstalledFromPlayStore = [];
  List<InstalledApplication> applicationsInstalledFromDeviceManufacturer = [];
  List<InstalledApplication> applicationsCanLunched = [];

  Future<void> setInstalledApplications(
    List<dynamic> installedApplicationsList,
  ) async {
    try {
      final installedApplicationsString = json.encode(installedApplicationsList);
      final installedApplicationsJson =
          json.decode(installedApplicationsString);

      for (var installedApplicationJson in installedApplicationsJson) {
        final InstalledApplication installedApplication =
            InstalledApplication.fromJson(installedApplicationJson);
        if (installedApplication.installedFromDeviceManufacturer) {
          applicationsInstalledFromDeviceManufacturer.add(installedApplication);
        }

        if (installedApplication.installedFromPlayStore) {
          applicationsInstalledFromPlayStore.add(installedApplication);
        }

        if (installedApplication.isLaunchable) {
          applicationsCanLunched.add(installedApplication);
        }

        installedApplications.add(installedApplication);
      }
    } catch (error) {
      print("Error: setInstalledApplications $error");
    }
    update();
  }
}
