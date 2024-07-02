// import 'package:flutter/material.dart';
// import 'package:widget_launcher/widgets/app_menu/app_menu_widget.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   PageController _pageController = PageController();
//   ScrollController _scrollController1 = ScrollController();
//   ScrollController _scrollController2 = ScrollController();
//   int canScrollDownToUpCount = 0;
//   bool canScrollDownToUp = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController1.addListener(_scrollListener1);
//     // _scrollController2.addListener(_scrollListener2);
//   }

//   void _scrollListener1() {
//     if (_scrollController1.position.atEdge) {
//       print("canScrollDownToUp $canScrollDownToUpCount");
//       if (canScrollDownToUpCount <= 2) {
//         setState(() {
//           canScrollDownToUpCount = canScrollDownToUpCount + 1;
//         });
//       } else {
//         setState(() {
//           canScrollDownToUp = true;
//         });
//       }
//       //  _pageController.nextPage(
//       //     duration: const Duration(milliseconds: 500),
//       //     curve: Curves.easeInOut,
//       //   );
//     }
//     // if (_scrollController1.position.pixels ==
//     //     _scrollController1.position.maxScrollExtent) {
//     //   print(
//     //       "_scrollListener1 ${_scrollController1.position.maxScrollExtent} ${_scrollToBottomCount}");
//     //   if (_scrollToBottomCount >= 2) {
//     //     setState(() {
//     //       _scrollToBottomCount = 0;
//     //     });
//     //     _pageController.nextPage(
//     //       duration: Duration(milliseconds: 500),
//     //       curve: Curves.easeInOut,
//     //     );
//     //   } else {
//     //     print("_scrollListener1 else");
//     //     setState(() {
//     //       _scrollToBottomCount++;
//     //     });
//     //   }
//     // }
//   }

//   void _scrollListener2() {
//     if (_scrollController2.position.pixels ==
//         _scrollController2.position.minScrollExtent) {
//       _pageController.previousPage(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController1.removeListener(_scrollListener1);
//     // _scrollController2.removeListener(_scrollListener2);
//     _scrollController1.dispose();
//     // _scrollController2.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("canScrollDownToUp $canScrollDownToUp");
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         children: [
//           SingleChildScrollView(
//             controller: _scrollController1,
//             child: Container(
//               color: Colors.blue,
//               child: AppMenuWidget(),
//             ),
//           ),
//           SingleChildScrollView(
//             // controller: _scrollController2,
//             child: Container(
//               color: Colors.green,
//               child: AppMenuWidget(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SwipeScreen extends StatefulWidget {
//   @override
//   _SwipeScreenState createState() => _SwipeScreenState();
// }

// class _SwipeScreenState extends State<SwipeScreen> {
//   PageController _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         children: [
//           FirstScreen(),
//           SecondScreen(),
//         ],
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Center(
//         child: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           primary: false,
//           child: Container(
//             height: 2500,
//             child: Text(
//               'Swipe Up to go to the second screen',
//               style: TextStyle(color: Colors.white, fontSize: 24),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Center(
//         child: Text(
//           'Swipe Down to go back to the first screen',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dy = 0.0; // To store the vertical drag position
  bool _isMenuOpened = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVerticalDrag(DragUpdateDetails details) {
    setState(() {
      _dy += details.primaryDelta!;
    });
  }

  void _handleVerticalEnd(DragEndDetails details) {
    if (_dy > 50) {
      _controller.reverse();
      _isMenuOpened = false;
    } else if (_dy < -50) {
      _controller.forward();
      _isMenuOpened = true;
    }
    _dy = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GestureDetector(
        onVerticalDragUpdate: _handleVerticalDrag,
        onVerticalDragEnd: _handleVerticalEnd,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double slide = 1.0 - (_controller.value * 0.5); // Adjust slide offset

            return Stack(
              children: <Widget>[
                // Home screen content
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1 * slide,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 2500,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Home Screen',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                // Menu screen content
                Positioned(
                  top: MediaQuery.of(context).size.height * (0.1 + slide * 0.9),
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'App Menu',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}