import 'dart:convert';
import 'package:get/get.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/shared_preferences_plugin.dart';

class ApplicationController extends GetxController {
  List<InstalledApplication> installedApplications = [];
  List<InstalledApplication> applicationsInstalledFromPlayStore = [];
  List<InstalledApplication> applicationsInstalledFromDeviceManufacturer = [];
  List<InstalledApplication> applicationsCanLunched = [];
  List<DrawerInfo> drawers = [];
  bool showAppLuncherLoader = true;
  bool showDrawerNameError = false;
  bool isResetForm = false;

  Future<void> setInstalledApplications(
    List<dynamic> installedApplicationList,
  ) async {
    try {
      String drawerList = await SharedPreferencesPlugin.getDrawers();
      await setDrawers(drawerList);

      final installedApplicationsString = json.encode(installedApplicationList);
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

    showAppLuncherLoader = false;
    update();
  }

  Future<void> setDrawers(String drawerList) async {
    try {
      final drawersJson = json.decode(drawerList);
      for (var drawerJson in drawersJson) {
        final DrawerInfo drawerInfo = DrawerInfo.fromJson(drawerJson);
        drawers.add(drawerInfo);
      }
    } catch (error) {
      print("Error: setDrawers $error");
    }
  }

  void restDrawerFormForInsert() {
    showDrawerNameError = false;
    isResetForm = true;
  }

  Future<void> addDrawer(String drawerName) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase().trim());

      if ((index == -1) &&
          drawerName.toLowerCase().trim().isNotEmpty &&
          (drawerName.toLowerCase().trim().length <= 20)) {
        drawers.add(DrawerInfo(name: drawerName.trim()));
        showDrawerNameError = false;
        isResetForm = true;

        await SharedPreferencesPlugin.addDrawer(
          json.encode(
            drawers.map((drawer) => drawer.toJson()).toList(),
          ),
        );
      } else {
        showDrawerNameError = true;
        isResetForm = false;
      }
    } catch (error) {
      print("Error: addDrawer $error");
    }

    update();
  }

  Future<void> deleteDrawer(String drawerName) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase());

      if (index != -1 ) {
        drawers.removeWhere((drawer) => drawer.name.toLowerCase() == drawerName.toLowerCase());
        await SharedPreferencesPlugin.addDrawer(
          json.encode(
            drawers.map((drawer) => drawer.toJson()).toList(),
          ),
        );
      } 
    } catch (error) {
      print("Error: deleteDrawer $error");
    }

    update();
  }
}
