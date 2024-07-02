import 'package:flutter/material.dart';
import 'package:widget_launcher/widgets/android/app_widget_page_view/android_app_widget_page_view_widget.dart';
import 'package:widget_launcher/widgets/android/dashboard/mobile_app_page_view/android_mobile_app_page_view_widget.dart';
import 'package:widget_launcher/widgets/android/message_notification_page_view/android_notification_page_view_widget.dart';

class AndroidDashboardWidget extends StatelessWidget {
  AndroidDashboardWidget({super.key});

  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: const [
        AndroidAppWidgetPageViewWidget(),
        AndroidMobileAppPageViewWidget(),
        AndroidMessageNotificationPageViewWidget(),
      ],
    );
  }
}
