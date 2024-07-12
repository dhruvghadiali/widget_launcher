import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_popup_item/android_app_menu_popup_item_widget.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_selected_app/android_app_drawer_selected_app_widget.dart';
import 'package:widget_launcher/widgets/android/settings/drawer_settings/reorderable_drawer_list/android_reorderable_drawer_list_widget.dart';

class AndroidAppDrawerNameWidget extends StatelessWidget {
  const AndroidAppDrawerNameWidget({
    super.key,
    required this.drawerInfo,
  });

  final DrawerInfo drawerInfo;

  void showPopupMenu({
    required Offset offset,
    required BuildContext context,
  }) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        overlay.size.width - offset.dx,
        overlay.size.height - offset.dy,
      ),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      items: [
       
        PopupMenuItem(
          enabled: false,
          value: 'reorder_drawer',
          child: AndroidAppMenuPopupItemWidget(
            index: 3,
            title: 'Organize Drawer',
            icon: Icons.sort_rounded,
            onPressed: () => onOrganizeDrawers(context: context),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'sort_drawer',
          child: AndroidAppMenuPopupItemWidget(
            index: 4,
            title: 'Sort Drawer',
            icon: Icons.sort_by_alpha,
            onPressed: () => onSortDrawer(context: context),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'edit_apps',
          child: AndroidAppMenuPopupItemWidget(
            index: 5,
            title: 'Edit Apps',
            icon: Icons.app_registration_sharp,
            onPressed: () {},
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'sort_apps',
          child: AndroidAppMenuPopupItemWidget(
            index: 6,
            title: 'Sort Apps',
            icon: Icons.sort_by_alpha,
            onPressed: () {},
          ),
        ),
         PopupMenuItem(
          enabled: false,
          value: 'delete',
          child: AndroidAppMenuPopupItemWidget(
            index: 0,
            title: 'Delete',
            icon: Icons.delete,
            onPressed: () => onDeleteDrawer(
              context: context,
              drawerName: drawerInfo.name,
            ),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'rename',
          child: AndroidAppMenuPopupItemWidget(
            index: 1,
            title: 'Rename',
            icon: Icons.edit_square,
            onPressed: () {},
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'lock',
          child: AndroidAppMenuPopupItemWidget(
            index: 2,
            title: 'Lock',
            icon: Icons.fingerprint,
            onPressed: () {},
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        print("Selected option: $value");
      }
      return null;
    });
  }

  void onOrganizeDrawers({
    required BuildContext context,
  }) {
    Navigator.pop(context);
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) => GetBuilder<ApplicationController>(
        builder: (applicationControllerContext) {
          return AndroidReorderableDrawerListWidget(
            drawers: applicationControllerContext.drawers,
          );
        },
      ),
    );
  }

  void onDeleteDrawer({
    required BuildContext context,
    required String drawerName,
  }) {
    Navigator.pop(context);
    final ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.deleteDrawer(drawerName);
  }

  void onSortDrawer({required BuildContext context}) {
    Navigator.pop(context);
    final ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.sortDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) => showPopupMenu(
        context: context,
        offset: details.globalPosition,
      ),
      child: ExpansionTile(
        enabled: drawerInfo.installedApplications.isEmpty ? false : true,
        iconColor: Theme.of(context).colorScheme.secondary,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.transparent,
          ),
        ),
        title: Text(
          drawerInfo.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                '${drawerInfo.installedApplications.length} Apps',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ],
        ),
        children: [
          AndroidAppDrawerSelectedAppWidget(
            installedApplications: drawerInfo.installedApplications,
            drawerName: drawerInfo.name,
          )
        ],
      ),
    );
  }
}
