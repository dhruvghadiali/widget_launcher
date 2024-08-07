import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/weather_controller.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/dashboard/android_dashboard_widget.dart';
import 'package:widget_launcher/widgets/android/common/loader/android_loader_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Timer _timer;
  WeatherController  weatherController = Get.put(WeatherController());
  
  @override
  void initState() {
    super.initState();
    weatherController.fetchWeather();
    _getInstalledAppliactions();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future _getInstalledAppliactions() async {
    await AndroidNativeCodePlugin.getInstalledApps();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (Timer timer) {
        weatherController.fetchWeather();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (applicationControllerContext) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: applicationControllerContext.showAppLuncherLoader
                ? const AndroidLoaderWidget()
                : AndroidDashboardWidget(),
          ),
        );
      },
    );
  }
}
