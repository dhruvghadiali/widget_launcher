import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/widgets/app_menu/app_detail/app_detail_widget.dart';

class GridViewAppMenuWidget extends StatefulWidget {
  const GridViewAppMenuWidget({
    super.key,
    required this.applications,
  });

  final List<InstalledApplication> applications;

  @override
  State<GridViewAppMenuWidget> createState() => _GridViewAppMenuWidgetState();
}

class _GridViewAppMenuWidgetState extends State<GridViewAppMenuWidget> {
  List<String> _alphabets = [];

  @override
  void initState() {
    _alphabets = List.generate(26, (index) => String.fromCharCode(index + 65));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _alphabets.length,
            itemBuilder: (BuildContext context, int index) {
              List<InstalledApplication> applicationsByAlphabet = widget
                  .applications
                  .where((application) =>
                      application.applicationName.startsWith(_alphabets[index]))
                  .toList();

              return applicationsByAlphabet.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _alphabets[index],
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                              return AppDetailWidget(
                                application: applicationsByAlphabet[index],
                              );
                            },
                          )
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
