import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/app_menu/app_menu_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.black,
        child: const AppMenuWidget(),
        // child: GetBuilder<InstalledApplicationController>(
        //   builder: (installedApplicationControllerContext) {
        //     return ListView.builder(
        //       itemCount: installedApplicationControllerContext.applicationsCanLunched.length,
        //       itemBuilder: (BuildContext context, int index) {
                
        //         // InstalledApplication installedAppliaction =
        //         //     installedApplicationControllerContext.applicationsCanLunched[index];
        //         // Uint8List imageBytes = base64.decode(installedAppliaction.appIconBase64.replaceAll(RegExp(r'\s'), ''));
        //         // return ListTile(
        //         //   leading: const Icon(Icons.list),
        //         //   title: TextButton(
        //         //     onPressed: () async {
        //         //       // try {
        //         //       //   final bool result = await nativeAndroid.invokeMethod(
        //         //       //       'openApp',
        //         //       //       {'packageName': installedAppliaction.packageName});
        //         //       //   if (!result) {
        //         //       //     print('Failed to open the app');
        //         //       //   }
        //         //       // } on PlatformException catch (e) {
        //         //       //   print("Failed to open the app: '${e.message}'.");
        //         //       // }
        //         //     },
        //         //     child: Column(
        //         //       children: [
        //         //         Text("${installedAppliaction.applicationName}"),
        //         //         Text("${installedAppliaction.isLaunchable}"),
        //         //         // Text("${installedAppliaction.appIconBase64.isNotEmpty ? 'Icon': 'No Icon'}"),
        //         //         imageBytes.isNotEmpty ?  Image.memory(imageBytes, width: 50, height: 50,) : Container()
        //         //        ],
        //         //     ),
        //         //   ),
        //         // );
        //       },
        //     );
        //   }
        // ),
      ),
    );
  }
}
