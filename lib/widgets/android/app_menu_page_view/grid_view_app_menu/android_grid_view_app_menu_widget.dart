import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_header/android_app_menu_header_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/grid_view_app_menu/grid_view_app_detail/android_grid_view_app_detail_widget.dart';

class AndroidGridViewAppMenuWidget extends StatefulWidget {
  const AndroidGridViewAppMenuWidget({super.key});

  @override
  State<AndroidGridViewAppMenuWidget> createState() =>
      _AndroidGridViewAppMenuWidgetState();
}

class _AndroidGridViewAppMenuWidgetState
    extends State<AndroidGridViewAppMenuWidget> {
  List<String> _alphabets = [];
  List<InstalledApplication> _applications = [];

  @override
  void initState() {
    final ApplicationController installedApplicationController =
        Get.put(ApplicationController());
    _alphabets = List.generate(26, (index) => String.fromCharCode(index + 65));
    _applications = installedApplicationController.applicationsCanLunched;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const AndroidAppMenuHeaderWidget(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _alphabets.length,
            itemBuilder: (BuildContext context, int index) {
              List<InstalledApplication> applicationsByAlphabet = _applications
                  .where((application) => application.applicationName
                      .toUpperCase()
                      .startsWith(_alphabets[index]))
                  .toList();

              return applicationsByAlphabet.isEmpty
                  ? Container()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _alphabets[index],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: applicationsByAlphabet.length,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  childAspectRatio:
                                      (MediaQuery.of(context).size.width *
                                              1.4) /
                                          MediaQuery.of(context).size.height),
                          itemBuilder: (BuildContext context, int index) {
                            return AndroidGridViewAppDetailWidget(
                              installedApplication:
                                  applicationsByAlphabet[index],
                            );
                          },
                        )
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
