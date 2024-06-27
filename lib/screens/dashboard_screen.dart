import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/installed_application_controller.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/utils/android_native_code_plugin.dart';

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
    return Scaffold(
      body: Center(
        child: GetBuilder<InstalledApplicationController>(
          builder: (installedApplicationControllerContext) {
            print("installedApplicationControllerContext ${ installedApplicationControllerContext.applicationsCanLunched.length}");
            return ListView.builder(
              itemCount: installedApplicationControllerContext.applicationsCanLunched.length,
              itemBuilder: (BuildContext context, int index) {
                InstalledApplication installedAppliaction =
                    installedApplicationControllerContext.applicationsCanLunched[index];
                Uint8List imageBytes = base64.decode(installedAppliaction.appIconBase64.replaceAll(RegExp(r'\s'), ''));

                print("Total Application ${installedApplicationControllerContext.applicationsCanLunched.length}");
                return ListTile(
                  leading: const Icon(Icons.list),
                  title: TextButton(
                    onPressed: () async {
                      // try {
                      //   final bool result = await nativeAndroid.invokeMethod(
                      //       'openApp',
                      //       {'packageName': installedAppliaction.packageName});
                      //   if (!result) {
                      //     print('Failed to open the app');
                      //   }
                      // } on PlatformException catch (e) {
                      //   print("Failed to open the app: '${e.message}'.");
                      // }
                    },
                    child: Column(
                      children: [
                        Text("${installedAppliaction.applicationName}"),
                        Text("${installedAppliaction.isLaunchable}"),
                        // Text("${installedAppliaction.appIconBase64.isNotEmpty ? 'Icon': 'No Icon'}"),
                        imageBytes.isNotEmpty ?  Image.memory(imageBytes, width: 50, height: 50,) : Container()
                       ],
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
