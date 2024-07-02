import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/grid_view_app_menu/android_grid_view_app_menu_widget.dart';

class AndroidAppMenuPageViewWidget extends StatelessWidget {
  const AndroidAppMenuPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Check which view will render list view or grid view
    return SingleChildScrollView(
      child: Container(
          color: Theme.of(context).colorScheme.primary,
          width: double.infinity,
          child: const AndroidGridViewAppMenuWidget()),
    );
  }
}
