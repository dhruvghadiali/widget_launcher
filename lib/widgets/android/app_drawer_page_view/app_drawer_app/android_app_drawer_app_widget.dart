import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/app_drawer_name/android_app_drawer_name_widget.dart';

class AndroidAppDrawerAppWidget extends StatelessWidget {
  const AndroidAppDrawerAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: GetBuilder<ApplicationController>(
            builder: (applicationControllerContext) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: applicationControllerContext.drawers.length,
                itemBuilder: (BuildContext context, int index) {
                  return AndroidAppDrawerNameWidget(
                    drawerInfo: applicationControllerContext.drawers[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
