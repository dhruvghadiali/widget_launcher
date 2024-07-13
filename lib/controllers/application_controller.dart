import 'dart:convert';
import 'package:get/get.dart';
import 'package:widget_launcher/helper/enum.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/shared_preferences_plugin.dart';

class ApplicationController extends GetxController {
  List<InstalledApplication> installedApplications = [];
  List<InstalledApplication> applicationsInstalledFromPlayStore = [];
  List<InstalledApplication> applicationsInstalledFromDeviceManufacturer = [];
  List<InstalledApplication> applicationsCanLunched = [];
  List<DrawerInfo> drawers = [];
  AppMenuType appMenuType = AppMenuType.grid;
  bool showAppLuncherLoader = true;
  bool showDrawerNameError = false;
  bool isResetForm = false;

  Future<void> setInstalledApplications(
    List<dynamic> installedApplicationList,
  ) async {
    installedApplications = [];
    applicationsInstalledFromPlayStore = [];
    applicationsInstalledFromDeviceManufacturer = [];
    applicationsCanLunched = [];

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
      drawers = [];
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
        drawers.add(
            DrawerInfo(name: drawerName.trim(), installedApplications: []));

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

  Future<void> reOrderDrawer({
    required int oldIndex,
    required int newIndex,
  }) async {
    try {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final DrawerInfo drawer = drawers.removeAt(oldIndex);
      drawers.insert(newIndex, drawer);

      await SharedPreferencesPlugin.addDrawer(
        json.encode(
          drawers.map((drawer) => drawer.toJson()).toList(),
        ),
      );
    } catch (error) {
      print("Error: reOrderDrawer $error");
    }

    update();
  }

  Future<void> sortDrawer() async {
    try {
      drawers.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

      await SharedPreferencesPlugin.addDrawer(
        json.encode(
          drawers.map((drawer) => drawer.toJson()).toList(),
        ),
      );
    } catch (error) {
      print("Error: sortDrawer $error");
    }

    update();
  }

  Future<void> deleteDrawer(String drawerName) async {
    try {
      int index = drawers.indexWhere(
          (drawer) => drawer.name.toLowerCase() == drawerName.toLowerCase());

      if (index != -1) {
        drawers.removeWhere(
            (drawer) => drawer.name.toLowerCase() == drawerName.toLowerCase());
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

  Future<void> addApplicationOnDrawer({
    required InstalledApplication installedApplication,
    required String drawerName,
  }) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase().trim());

      if (index != -1) {
        int applicationIndex = drawers[index].installedApplications.indexWhere(
            (installedApp) =>
                installedApp.applicationName.toLowerCase() ==
                installedApplication.applicationName.toLowerCase());

        if (applicationIndex == -1) {
          List<InstalledApplication> drawerInstalledApplications =
              drawers[index].installedApplications;
          drawerInstalledApplications.add(installedApplication);
          drawers[index]
              .copyWith(installedApplications: drawerInstalledApplications);

          await SharedPreferencesPlugin.addDrawer(
            json.encode(
              drawers.map((drawer) => drawer.toJson()).toList(),
            ),
          );
        }
      }
    } catch (error) {
      print("Error: addApplicationOnDrawer $error");
    }

    update();
  }

  Future<void> reOrderApplicationOnDrawer({
    required String drawerName,
    required int oldIndex,
    required int newIndex,
  }) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase().trim());

      if (index != -1) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final InstalledApplication installedApplication =
            drawers[index].installedApplications.removeAt(oldIndex);
        drawers[index]
            .installedApplications
            .insert(newIndex, installedApplication);

        await SharedPreferencesPlugin.addDrawer(
          json.encode(
            drawers.map((drawer) => drawer.toJson()).toList(),
          ),
        );
      }
    } catch (error) {
      print("Error: reOrderApplicationOnDrawer $error");
    }

    update();
  }

  Future<void> sortApplications(String drawerName) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase().trim());

      if (index != -1) {
        drawers[index].installedApplications.sort((a, b) {
          return a.applicationName
              .toLowerCase()
              .compareTo(b.applicationName.toLowerCase());
        });

        await SharedPreferencesPlugin.addDrawer(
          json.encode(
            drawers.map((drawer) => drawer.toJson()).toList(),
          ),
        );
      }
    } catch (error) {
      print("Error: sortApplications $error");
    }

    update();
  }

  Future<void> removeApplicationFromDrawer({
    required InstalledApplication installedApplication,
    required String drawerName,
  }) async {
    try {
      int index = drawers.indexWhere((drawer) =>
          drawer.name.toLowerCase() == drawerName.toLowerCase().trim());

      if (index != -1) {
        List<InstalledApplication> drawerInstalledApplications =
            drawers[index].installedApplications;
        drawerInstalledApplications.removeWhere((installedApp) =>
            installedApp.applicationName.toLowerCase() ==
            installedApplication.applicationName.toLowerCase());
        drawers[index]
            .copyWith(installedApplications: drawerInstalledApplications);

        await SharedPreferencesPlugin.addDrawer(
          json.encode(
            drawers.map((drawer) => drawer.toJson()).toList(),
          ),
        );
      }
    } catch (error) {
      print("Error: removeApplicationFromDrawer $error");
    }

    update();
  }

  Future<void> setAppMenuType(AppMenuType selectedAppMenuType) async {
    appMenuType = selectedAppMenuType;
    update();
  }
}
