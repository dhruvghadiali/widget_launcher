import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/helper/enum.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_card/android_installed_app_card_widget.dart';
import 'package:widget_launcher/widgets/android/common/installed_app_detail/android_installed_app_detail_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_popup_item/android_app_menu_popup_item_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_drawer_selection/android_app_menu_drawer_selection_widget.dart';

class AndroidAppMenuSelectionWidget extends StatelessWidget {
  const AndroidAppMenuSelectionWidget({
    super.key,
    required this.installedApplication,
  });

  final InstalledApplication installedApplication;

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
          value: 'app_dashboard',
          child: AndroidAppMenuPopupItemWidget(
            index: 0,
            title: 'App Dashboard',
            icon: Icons.bar_chart_rounded,
            onPressed: () {},
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'app_drawer',
          child: AndroidAppMenuPopupItemWidget(
            index: 1,
            title: 'App Drawer',
            icon: Icons.view_list_rounded,
            onPressed: () => showAppDrawer(context),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'dock',
          child: AndroidAppMenuPopupItemWidget(
            index: 2,
            title: 'Dock',
            icon: Icons.file_download_outlined,
            onPressed: () {},
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'hide',
          child: AndroidAppMenuPopupItemWidget(
            index: 3,
            title: 'Hide',
            icon: Icons.hide_source_rounded,
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

  void showAppDrawer(BuildContext context) {
    Navigator.of(context).pop();
    showModalBottomSheet<void>(
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return AndroidAppMenuDrawerSelectionWidget(
          installedApplication: installedApplication,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (applicationControllerContext) {
        switch (applicationControllerContext.appMenuType) {
          case AppMenuType.grid:
            return AndroidInstalledAppCardWidget(
              installedApplication: installedApplication,
              onLongPressStart: (LongPressStartDetails details) =>
                  showPopupMenu(
                context: context,
                offset: details.globalPosition,
              ),
            );
          case AppMenuType.list:
            return AndroidInstalledAppDetailWidget(
              installedApplication: installedApplication,
              onLongPressStart: (LongPressStartDetails details) =>
                  showPopupMenu(
                context: context,
                offset: details.globalPosition,
              ),
            );
          case AppMenuType.hidden:
            return AndroidInstalledAppCardWidget(
              installedApplication: installedApplication,
              onLongPressStart: (LongPressStartDetails details) =>
                  showPopupMenu(
                context: context,
                offset: details.globalPosition,
              ),
            );
          case AppMenuType.secure:
            return AndroidInstalledAppCardWidget(
              installedApplication: installedApplication,
              onLongPressStart: (LongPressStartDetails details) =>
                  showPopupMenu(
                context: context,
                offset: details.globalPosition,
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
