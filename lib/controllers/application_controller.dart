import 'dart:convert';
import 'package:get/get.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/models/installed_application.dart';

class ApplicationController extends GetxController {
  List<InstalledApplication> installedApplications = [];
  List<InstalledApplication> applicationsInstalledFromPlayStore = [];
  List<InstalledApplication> applicationsInstalledFromDeviceManufacturer = [];
  List<InstalledApplication> applicationsCanLunched = [];
  List<DrawerInfo> drawers = [];

  Future<void> setInstalledApplications(
    List<dynamic> installedApplicationsList,
  ) async {
    DrawerInfo drawerInfo = DrawerInfo(name: '');
    drawers = [
      drawerInfo.copyWith(name: 'Finance'),
      drawerInfo.copyWith(name: 'Office'),
      drawerInfo.copyWith(name: 'Google'),
      drawerInfo.copyWith(name: 'Social Media'),
      drawerInfo.copyWith(name: 'Editing'),
      drawerInfo.copyWith(name: 'News')
    ];
    
    try {
      final installedApplicationsString =
          json.encode(installedApplicationsList);
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

      applicationsCanLunched.sort((a, b) {
        return a.applicationName
            .toLowerCase()
            .compareTo(b.applicationName.toLowerCase());
      });
    } catch (error) {
      print("Error: setInstalledApplications $error");
    }
    update();
  }
}
