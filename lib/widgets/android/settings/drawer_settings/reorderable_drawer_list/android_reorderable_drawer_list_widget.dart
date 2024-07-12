import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/drawer_info.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/common/error_messages/empty_drawer_list/android_empty_drawer_list.dart';
import 'package:widget_launcher/widgets/android/common/bottom_sheet/panel_bottom_sheet/android_panel_bottom_sheet_widget.dart';

class AndroidReorderableDrawerListWidget extends StatelessWidget {
  const AndroidReorderableDrawerListWidget({
    super.key,
    required this.drawers,
  });

  final List<DrawerInfo> drawers;

  void onReorder(int oldIndex, int newIndex) {
    ApplicationController applicationController =
        Get.put(ApplicationController());
    applicationController.reOrderDrawer(
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
        title: 'Organize Drawers',
        subtitle:
            'You can manage drawers effortlessly, organize existing drawer names as needed. The intuitive interface ensures a smooth experience, making it easy to keep the drawer list up-to-date and organized.',
        child: drawers.isEmpty
            ? const AndroidEmptyDrawerList()
            : Expanded(
                child: ReorderableListView.builder(
                  onReorder: (int oldIndex, int newIndex) =>
                      onReorder(oldIndex, newIndex),
                  itemCount: drawers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      key: Key('$index'),
                      trailing: const Icon(
                        Icons.line_weight_outlined,
                      ),
                      title: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                drawers[index].name,
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
