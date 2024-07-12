import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/controllers/application_controller.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_selection/android_app_menu_selection_widget.dart';

class AndroidListViewAppMenuWidget extends StatefulWidget {
  const AndroidListViewAppMenuWidget({super.key});

  @override
  State<AndroidListViewAppMenuWidget> createState() =>
      _AndroidListViewAppMenuWidgetState();
}

class _AndroidListViewAppMenuWidgetState
    extends State<AndroidListViewAppMenuWidget> {
  List<String> _alphabets = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<List<String>> _fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    _alphabets = List.generate(26, (index) => String.fromCharCode(index + 65));
    return _alphabets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: const Center(
              child: Text('No data available'),
            ),
          );
        } else {
          return GetBuilder<ApplicationController>(
            builder: (applicationControllercontext) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _alphabets.length,
                itemBuilder: (BuildContext context, int index) {
                  List<InstalledApplication> applicationsByAlphabet =
                      applicationControllercontext.applicationsCanLunched
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
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: applicationsByAlphabet.length,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return AndroidAppMenuSelectionWidget(
                                  installedApplication:
                                      applicationsByAlphabet[index],
                                );
                              },
                            )
                          ],
                        );
                },
              );
            },
          );
        }
      },
    );
  }
}
