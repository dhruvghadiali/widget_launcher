import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/helper/enum.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_header_popup_button/app_menu_header_popup_item/android_app_menu_header_popup_item_widget.dart';

class AndroidAppMenuHeaderPopupButtonWidget extends StatelessWidget {
  const AndroidAppMenuHeaderPopupButtonWidget({super.key});

  onSelection(int item) {
    ApplicationController applicationController =
        Get.put(ApplicationController());

    switch (item) {
      case 0:
        applicationController.setAppMenuType(AppMenuType.grid);
        break;
      case 1:
        applicationController.setAppMenuType(AppMenuType.list);
        break;
      case 2:
        applicationController.setAppMenuType(AppMenuType.hidden);
        break;
      case 3:
        applicationController.setAppMenuType(AppMenuType.secure);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (applicationControllerContext) {
        return PopupMenuButton<int>(
          icon: const Icon(
            Icons.filter_list_rounded,
          ),
          onSelected: (item) => onSelection(item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: AndroidAppMenuHeaderPopupItemWidget(
                icon: Icons.grid_view_rounded,
                title: 'Grid View',
                isActive:
                    applicationControllerContext.appMenuType == AppMenuType.grid
                        ? true
                        : false,
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: AndroidAppMenuHeaderPopupItemWidget(
                icon: Icons.view_list_rounded,
                title: 'List View',
                isActive:
                    applicationControllerContext.appMenuType == AppMenuType.list
                        ? true
                        : false,
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: AndroidAppMenuHeaderPopupItemWidget(
                icon: Icons.hide_source_rounded,
                title: 'Hidden Apps',
                isActive: applicationControllerContext.appMenuType ==
                        AppMenuType.hidden
                    ? true
                    : false,
              ),
            ),
            PopupMenuItem<int>(
              value: 3,
              child: AndroidAppMenuHeaderPopupItemWidget(
                icon: Icons.fingerprint,
                title: 'Secure Apps',
                isActive: applicationControllerContext.appMenuType ==
                        AppMenuType.secure
                    ? true
                    : false,
              ),
            ),
          ],
        );
      },
    );
  }
}
