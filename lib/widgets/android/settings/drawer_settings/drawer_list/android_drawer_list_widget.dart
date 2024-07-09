import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/bottom_sheet/panel_bottom_sheet/android_panel_bottom_sheet_widget.dart';
import 'package:widget_launcher/widgets/android/common/form_fields/button/android_icon_button_widget.dart';
import 'package:widget_launcher/widgets/android/common/error_messages/empty_drawer_list/android_empty_drawer_list.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/drawer_form/android_drawer_form_widget.dart';

class AndroidDrawerListWidget extends StatelessWidget {
  const AndroidDrawerListWidget({
    super.key,
    required this.drawers,
  });

  final List<DrawerInfo> drawers;

  void onDeleteDrawer({
    required BuildContext context,
    required String drawerName,
  }) {
    final ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.deleteDrawer(drawerName);
    Navigator.pop(context);
  }

  void onEditDrawer({
    required BuildContext context,
    required String drawerName,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AndroidPanelBottomSheetWidget(
          isKeybordInteration: true,
          title: 'Edit Drawer',
          subtitle:
              'Edit drawer allows you to store and organize installed applications according to your preferences and usage patterns, enhancing accessibility and experience.',
          child: AndroidDrawerFormWidget(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawers.isEmpty
        ? const AndroidEmptyDrawerList()
        : ListView.builder(
            itemCount: drawers.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        drawers[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ),
                    AndroidIconButtonWidget(
                      tooltip: 'Edit',
                      icon: Icons.edit_document,
                      onPressed: () => onEditDrawer(
                        context: context,
                        drawerName: drawers[index].name,
                      ),
                    ),
                    AndroidIconButtonWidget(
                      tooltip: 'Delete',
                      icon: Icons.delete,
                      iconColor: Theme.of(context).colorScheme.error,
                      onPressed: () => onDeleteDrawer(
                        context: context,
                        drawerName: drawers[index].name,
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
