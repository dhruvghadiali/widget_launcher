import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/widgets/android/app_drawer_page_view/android_app_drawer_page_view_widget.dart';
import 'package:widget_launcher/widgets/android/app_menu_page_view/android_app_menu_page_view_widget.dart';

class AndroidMobileAppPageViewWidget extends StatefulWidget {
  const AndroidMobileAppPageViewWidget({super.key});

  @override
  State<AndroidMobileAppPageViewWidget> createState() =>
      _AndroidMobileAppPageViewWidgetState();
}

class _AndroidMobileAppPageViewWidgetState
    extends State<AndroidMobileAppPageViewWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  IconData _navigationIcon = Icons.arrow_circle_up_rounded;

  void _onNavitionPressed() {
    switch (_navigationIcon) {
      case Icons.arrow_circle_up_rounded:
        setState(() {
          _navigationIcon = Icons.arrow_circle_down_rounded;
        });
        _pageController.nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );
        break;
      case Icons.arrow_circle_down_rounded:
        setState(() {
          _navigationIcon = Icons.arrow_circle_up_rounded;
        });
        _pageController.previousPage(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubicEmphasized,
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              AndroidAppDrawerPageViewWidget(),
              AndroidAppMenuPageViewWidget(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 15, left: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .extension<ExtensionsThemeData>()!
                          .success,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () => _onNavitionPressed(),
                      icon: Icon(_navigationIcon),
                      iconSize: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
