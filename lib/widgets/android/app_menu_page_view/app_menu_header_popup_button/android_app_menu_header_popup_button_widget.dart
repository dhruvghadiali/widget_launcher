import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_header_popup_button/app_menu_header_popup_item/android_app_menu_header_popup_item_widget.dart';

class AndroidAppMenuHeaderPopupButtonWidget extends StatelessWidget {
  const AndroidAppMenuHeaderPopupButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(
        Icons.filter_list_rounded,
      ),
      onSelected: (item) {
        print(item);
      },
      itemBuilder: (context) => const [
        PopupMenuItem<int>(
          value: 0,
          child: AndroidAppMenuHeaderPopupItemWidget(
            icon: Icons.grid_view_rounded,
            title: 'Grid View',
            isActive: true,
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: AndroidAppMenuHeaderPopupItemWidget(
            icon: Icons.view_list_rounded,
            title: 'List View',
            isActive: false,
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: AndroidAppMenuHeaderPopupItemWidget(
            icon: Icons.hide_source_rounded,
            title: 'Hidden Apps',
            isActive: false,
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: AndroidAppMenuHeaderPopupItemWidget(
            icon: Icons.fingerprint,
            title: 'Secure Apps',
            isActive: false,
          ),
        ),
      ],
    );
  }
}
