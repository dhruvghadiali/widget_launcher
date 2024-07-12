import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/drawer_form/android_drawer_form_widget.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/drawer_list/android_drawer_list_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile/android_settings_extension_tile_widget.dart';
import 'package:widget_launcher/widgets/android/common/bottom_sheet/panel_bottom_sheet/android_panel_bottom_sheet_widget.dart';
import 'package:widget_launcher/widgets/android/settings/settings_extension_tile_text_button/android_extension_tile_text_button_widget.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/reorderable_drawer_list/android_reorderable_drawer_list_widget.dart';

class AndroidDrawerSettingsWidget extends StatelessWidget {
  const AndroidDrawerSettingsWidget({super.key});

  void onAddDrawer(BuildContext context) {
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
          title: 'Add Drawer',
          subtitle:
              'Add new drawer allows you to store and organize installed applications according to your preferences and usage patterns, enhancing accessibility and experience.',
          child: AndroidDrawerFormWidget(),
        ),
      ),
    );
  }

  void onViewDrawers({
    required BuildContext context,
    required List<DrawerInfo> drawers,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AndroidPanelBottomSheetWidget(
          isKeybordInteration: false,
          title: 'View Drawers',
          subtitle:
              'You can manage drawers effortlessly, delete or modify existing drawer names as needed. The intuitive interface ensures a smooth experience, making it easy to keep the drawer list up-to-date and organized.',
          child: AndroidDrawerListWidget(drawers: drawers),
        ),
      ),
    );
  }

  void onOrganizeDrawers({
    required BuildContext context,
    required List<DrawerInfo> drawers,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) =>AndroidReorderableDrawerListWidget(drawers: drawers) ,
    );
  }

  void onSortDrawers() {
    final ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.sortDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AndroidSettingsExtensionTileWidget(
      title: 'Drawer',
      subtitle:
          'You can categorize and organize their installed applications into custom drawer names',
      children: [
        AndroidExtensionTileTextButtonWidget(
          onPressed: () => onAddDrawer(context),
          title: 'Add drawer',
          icon: Icons.add_card_sharp,
        ),
        GetBuilder<ApplicationController>(
          builder: (applicationControllerContext) {
            return AndroidExtensionTileTextButtonWidget(
              onPressed: () => onViewDrawers(
                context: context,
                drawers: applicationControllerContext.drawers,
              ),
              title: 'View drawers',
              icon: Icons.list_rounded,
              subtitle:
                  '${applicationControllerContext.drawers.length} Drawers',
            );
          },
        ),
        GetBuilder<ApplicationController>(
          builder: (applicationControllerContext) {
            return AndroidExtensionTileTextButtonWidget(
              onPressed: () => onOrganizeDrawers(
                context: context,
                drawers: applicationControllerContext.drawers,
              ),
              title: 'Organize drawers',
              icon: Icons.sort_rounded,
            );
          },
        ),
        GetBuilder<ApplicationController>(
          builder: (applicationControllerContext) {
            return AndroidExtensionTileTextButtonWidget(
              onPressed: () => onSortDrawers(),
              title: 'Sort drawers',
              icon: Icons.sort_by_alpha,
            );
          },
        ),
      ],
    );
  }
}
