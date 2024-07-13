
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/utils/utility.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/error_messages/empty_drawer_list/android_empty_drawer_list.dart';
import 'package:widget_launcher/widgets/android/common/bottom_sheet/panel_bottom_sheet/android_panel_bottom_sheet_widget.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_reorderable_drawer_app/app_drawer_selected_app_icon/android_app_drawer_selected_app_icon_widget.dart';


class AndroidAppDrawerReorderableDrawerAppWidget extends StatelessWidget {
  const AndroidAppDrawerReorderableDrawerAppWidget({
    super.key,
    required this.drawerInfo,
    required this.installedApplications,
  });

  final DrawerInfo drawerInfo;
  final List<InstalledApplication> installedApplications;

  void onReorder(int oldIndex, int newIndex) {
    ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.reOrderApplicationOnDrawer(
      drawerName: drawerInfo.name,
      oldIndex: oldIndex,
      newIndex: newIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AndroidPanelBottomSheetWidget(
        isKeybordInteration: false,
        title: drawerInfo.name,
        subtitle:
            'You can manage apps effortlessly, organize existing app names as needed. The intuitive interface ensures a smooth experience, making it easy to keep the app list up-to-date and organized.',
        child: drawerInfo.installedApplications.isEmpty
            ? const AndroidEmptyDrawerList()
            : ReorderableListView.builder(
              onReorder: (int oldIndex, int newIndex) =>
                  onReorder(oldIndex, newIndex),
                  
              itemCount: drawerInfo.installedApplications.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                      key: Key('$index'),
                      trailing: const Icon(
                        Icons.line_weight_outlined,
                      ),
                      title: Row(
                        children: [
                          AndroidAppDrawerSelectedAppIconWidget(
                            imageBytes: Utility.converToUnit8List(
                              drawerInfo
                                  .installedApplications[index].appIconBase64,
                            ),
                            luncherIcon: drawerInfo
                                .installedApplications[index].luncherIcon,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              drawerInfo
                                  .installedApplications[index].applicationName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
              },
            ),
      ),
    );
  }
}
