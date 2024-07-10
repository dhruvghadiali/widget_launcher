import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_card/android_installed_app_card_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_popup_item/android_app_menu_popup_item_widget.dart';

class AndroidAppDrawerSelectedAppWidget extends StatelessWidget {
  const AndroidAppDrawerSelectedAppWidget({
    super.key,
    required this.installedApplications,
    required this.drawerName,
  });

  final List<InstalledApplication> installedApplications;
  final String drawerName;

  void showPopupMenu({
    required Offset offset,
    required BuildContext context,
    required InstalledApplication installedApplication,
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
          value: 'remove',
          child: AndroidAppMenuPopupItemWidget(
            index: 0,
            title: 'Remove',
            icon: Icons.close,
            onPressed: () => removeApplicationFromDrawer(
              context: context,
              installedApplication: installedApplication,
            ),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'app_dashboard',
          child: AndroidAppMenuPopupItemWidget(
            index: 1,
            title: 'App Dashboard',
            icon: Icons.bar_chart_rounded,
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

  Future<void> removeApplicationFromDrawer({
    required BuildContext context,
    required InstalledApplication installedApplication,
  }) async {
    Navigator.pop(context);
    final ApplicationController applicationController =
        Get.put(ApplicationController());
    await applicationController.removeApplicationFromDrawer(
      installedApplication: installedApplication,
      drawerName: drawerName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: installedApplications.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: (MediaQuery.of(context).size.width * 1.4) /
              MediaQuery.of(context).size.height),
      itemBuilder: (BuildContext context, int index) {
        return AndroidInstalledAppCardWidget(
          installedApplication: installedApplications[index],
          onLongPressStart: (LongPressStartDetails details) => showPopupMenu(
            context: context,
            offset: details.globalPosition,
            installedApplication: installedApplications[index],
          ),
        );
      },
    );
  }
}
