import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/widgets/android/dashboard/android_dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    getInstalledAppliactions();
  }

  Future getInstalledAppliactions() async {
    await AndroidNativeCodePlugin.getInstalledApps();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (installedApplicationControllerContext) {
        return Scaffold(
          body: AndroidDashboardWidget(),
        );
      },
    );
  }
}
