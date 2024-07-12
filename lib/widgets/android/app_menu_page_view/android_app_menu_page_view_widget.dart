import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/helper/enum.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_header/android_app_menu_header_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/grid_view_app_menu/android_grid_view_app_menu_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/list_view_app_menu/android_list_view_app_menu_widget.dart';

class AndroidAppMenuPageViewWidget extends StatelessWidget {
  const AndroidAppMenuPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 100, right: 10, left: 10),
        color: Theme.of(context).colorScheme.surface,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AndroidAppMenuHeaderWidget(),
            GetBuilder<ApplicationController>(
              builder: (applicationControllerContext) {
                switch (applicationControllerContext.appMenuType) {
                  case AppMenuType.grid:
                    return const AndroidGridViewAppMenuWidget();
                  case AppMenuType.list:
                    return const AndroidListViewAppMenuWidget();
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
