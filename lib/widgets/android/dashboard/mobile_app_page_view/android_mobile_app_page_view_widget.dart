import 'package:flutter/material.dart';
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
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                     color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 5,
                    offset: const Offset(-20, 0),
                  ),
                   BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 5,
                    offset: const Offset(20, 0),
                  ),
                ],
              ),
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  AndroidAppDrawerPageViewWidget(),
                  AndroidAppMenuPageViewWidget(),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15, left: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _onNavitionPressed(),
                  icon: Icon(_navigationIcon),
                  iconSize: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
