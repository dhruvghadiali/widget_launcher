import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:widget_launcher/controllers/application_controller.dart';

class AndroidNativeCodePlugin {
  static const MethodChannel _channel =
      MethodChannel('com.example.widget_launcher/android');

  static Future<void> getInstalledApps() async {
    try {
      final ApplicationController installedApplicationController =
          Get.put(ApplicationController());
      List<dynamic> installedApplications =
          await _channel.invokeMethod('installedApps');
      installedApplicationController
          .setInstalledApplications(installedApplications);
    } catch (error) {
      print("Error: Get installed applications $error");
    }
  }

  static Future<void> openApp(String packageName) async {
    try {
      bool result =
          await _channel.invokeMethod('openApp', {'packageName': packageName});
      if (!result) {
        print("Open Alert for app opening issue $packageName");
      }
    } catch (error) {
      print("Error: Get installed applications $error");
    }
  }

  static Future<Map<dynamic, dynamic>> getTextMessages() async {
    try {
      return await _channel.invokeMethod('getTextMessages');
    } catch (error) {
      print("Error: Failed to get messages '$error'.");
      return {};
    }
  }
}
