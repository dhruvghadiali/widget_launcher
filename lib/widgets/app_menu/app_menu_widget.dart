import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';
import 'package:widget_launcher/controllers/installed_application_controller.dart';
import 'package:widget_launcher/widgets/app_menu/grid_view_app_menu/grid_view_app_menu_widget.dart';

class AppMenuWidget extends StatefulWidget {
  const AppMenuWidget({super.key});

  @override
  State<AppMenuWidget> createState() => _AppMenuWidgetState();
}

class _AppMenuWidgetState extends State<AppMenuWidget> {
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
    return GetBuilder<InstalledApplicationController>(
      builder: (installedApplicationControllerContext) {
        return GridViewAppMenuWidget(
          applications:
              installedApplicationControllerContext.applicationsCanLunched,
        );
      },
    );
  }
}
