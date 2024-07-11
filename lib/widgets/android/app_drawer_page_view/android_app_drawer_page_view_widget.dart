import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_app/android_app_drawer_app_widget.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_dock/android_app_drawer_dock_widget.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_header/android_app_drawer_header_widget.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_weather/android_app_drawe_weather_widget.dart';

class AndroidAppDrawerPageViewWidget extends StatelessWidget {
  const AndroidAppDrawerPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(bottom: 70),
        child: const Column(
          children: [
            AndroidAppDraweWeatherWidget(),
            AndroidAppDrawerHeaderWidget(),
            AndroidAppDrawerAppWidget(),
            AndroidAppDrawerDockWidget(),
          ],
        ),
      ),
    );
  }
}
