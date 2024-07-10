import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/error_messages/empty_drawer_list/android_empty_drawer_list.dart';

class AndroidAppMenuDrawerSelectionWidget extends StatelessWidget {
  AndroidAppMenuDrawerSelectionWidget({
    super.key,
    required this.installedApplication,
  });

  final InstalledApplication installedApplication;
  final ApplicationController applicationController =
      Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              'Select Drawer',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .extension<ExtensionsThemeData>()!
                        .warning,
                  ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 25, right: 20, left: 20),
            alignment: Alignment.center,
            child: Text(
              "Select a drawer category to have your apps automatically grouped into it. You'll be able to easily access your app based on your preferences.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
          Divider(
            color: Theme.of(context).extension<ExtensionsThemeData>()!.warning,
          ),
          Expanded(
            child: applicationController.drawers.isEmpty
                ? const AndroidEmptyDrawerList()
                : ListView.builder(
                    itemCount: applicationController.drawers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        highlightColor: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          applicationController.addApplicationOnDrawer(
                            installedApplication: installedApplication,
                            drawerName:
                                applicationController.drawers[index].name,
                          );
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  applicationController.drawers[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${applicationController.drawers[index].installedApplications.length} apps',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
