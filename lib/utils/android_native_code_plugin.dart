import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:widget_launcher/controllers/application_controller.dart';

class AndroidNativeCodePlugin {
  static const MethodChannel _channel =
      MethodChannel('com.example.widget_launcher/android');

  static Future<void> getInstalledApps() async {
    try {
      final ApplicationController installedApplicationController = Get.put(ApplicationController());
      List<dynamic> installedApplications =
          await _channel.invokeMethod('installedApps');
      installedApplicationController.setInstalledApplications(installedApplications);
    } catch (error) {
      print("Error: Get installed applications $error");
    }
  }
}
