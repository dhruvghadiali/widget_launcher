import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/widgets/android/common/error_messages/empty_drawer_list/android_empty_drawer_list.dart';

class AndroidAppMenuPopupItemWidget extends StatelessWidget {
  const AndroidAppMenuPopupItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  final IconData icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () {
        Navigator.of(context).pop();
        showModalBottomSheet<void>(
          backgroundColor: Theme.of(context).colorScheme.primary,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (BuildContext context) {
            final ApplicationController installedApplicationController =
                Get.put(ApplicationController());

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
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .extension<ExtensionsThemeData>()!
                                    .warning,
                              ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 25, right: 20, left: 20),
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
                    color: Theme.of(context)
                        .extension<ExtensionsThemeData>()!
                        .warning,
                  ),
                  Expanded(
                    child: installedApplicationController.drawers.isEmpty
                        ? const AndroidEmptyDrawerList()
                        : ListView.builder(
                            itemCount:
                                installedApplicationController.drawers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                highlightColor:
                                    Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          installedApplicationController
                                              .drawers[index].name,
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
                                        '3 apps',
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
          },
        );
      },
      pressElevation: 10,
      elevation: 2,
      shadowColor: Theme.of(context).extension<ExtensionsThemeData>()!.warning,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      avatar: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
