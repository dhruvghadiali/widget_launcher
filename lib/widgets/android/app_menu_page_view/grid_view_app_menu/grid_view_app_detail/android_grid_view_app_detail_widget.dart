import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:widget_launcher/models/installed_application.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/app_menu_popup_item/android_app_menu_popup_item_widget.dart';

class AndroidGridViewAppDetailWidget extends StatefulWidget {
  const AndroidGridViewAppDetailWidget({
    super.key,
    required this.application,
  });

  final InstalledApplication application;

  @override
  State<AndroidGridViewAppDetailWidget> createState() =>
      _AndroidGridViewAppDetailWidgetState();
}

class _AndroidGridViewAppDetailWidgetState
    extends State<AndroidGridViewAppDetailWidget> {
  late Uint8List imageBytes;

  @override
  void initState() {
    super.initState();
    imageBytes = base64
        .decode(widget.application.appIconBase64.replaceAll(RegExp(r'\s'), ''));
  }

  void _showPopupMenu(Offset offset) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        overlay.size.width - offset.dx,
        overlay.size.height - offset.dy,
      ),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      items: const [
        PopupMenuItem(
          enabled: false,
          value: 'app_dashboard',
          child: AndroidAppMenuPopupItemWidget(
            icon: Icons.bar_chart_rounded,
            title: 'App Dashboard',
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'app_drawer',
          child: AndroidAppMenuPopupItemWidget(
            icon: Icons.view_list_rounded,
            title: 'App Drawer',
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'dock',
          child: AndroidAppMenuPopupItemWidget(
            icon: Icons.file_download_outlined,
            title: 'Dock',
          ),
        ),
        PopupMenuItem(
          enabled: false,
          value: 'hide',
          child: AndroidAppMenuPopupItemWidget(
            icon: Icons.hide_source_rounded,
            title: 'Hide',
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        print("Selected option: $value");
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Open New App");
      },
      onLongPressStart: (LongPressStartDetails details) {
        _showPopupMenu(details.globalPosition);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: widget.application.luncherIcon.isEmpty
                  ? imageBytes.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            imageBytes,
                            width: 40,
                            height: 40,
                          ),
                        )
                      : Container()
                  : Image.asset(
                      'assets/images/${widget.application.luncherIcon}.png',
                      width: 30,
                      height: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
            ),
            Text(
              widget.application.applicationName,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
