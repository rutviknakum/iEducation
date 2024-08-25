import 'package:flutter/material.dart';
import 'package:user_apppp/common/navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/home_screen.dart';
import 'package:user_apppp/screens/settings_screen.dart';

class HomeScreenBottomBar extends StatefulWidget {
  const HomeScreenBottomBar({super.key});

  @override
  State<HomeScreenBottomBar> createState() => _HomeScreenBottomBarState();
}

class _HomeScreenBottomBarState extends State<HomeScreenBottomBar>
    with TickerProviderStateMixin {
  List<Map> tabData = [
    {
      'icon': Icons.home,
      'text': 'Home',
    },
    {
      'icon': Icons.settings,
      'text': 'Setting',
    },
  ];
  int activeIndex = 0;
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
  List<Widget> screensList = [const HomeScreen(), const SettingScreen()];
  @override
  void initState() {
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolor,
        child: Image(
          height: MediaQuery.of(context).size.height / 22,
          color: white,
          image: const AssetImage('assets/icons/icon.png'),
        ),
        onPressed: () {
          setState(() {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const QRViewExample(),
            //     ));
          });
          // _fabAnimationController.reset();
          // _borderRadiusAnimationController.reset();
          // _borderRadiusAnimationController.forward();
          // _fabAnimationController.forward();
        },
      ),
      body: NotificationListener<ScrollNotification>(
        //onNotification: onScrollNotification,
        child: NavigationScreen(screensList[activeIndex]),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: background,
        itemCount: tabData.length,
        tabBuilder: (index, isActive) {
          // final Color color = isActive ? primarycolor : background;
          return Column(
            children: [
              Icon(tabData[index]['icon']),
              Text(tabData[index]['text'])
            ],
          );
        },
        activeIndex: activeIndex,
        // splashColor: primarycolor,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        hideAnimationController: _hideBottomBarAnimationController,
        onTap: (index) => setState(() => activeIndex = index),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  final Widget currentPage;

  const NavigationScreen(this.currentPage, {super.key});

  @override
  NavigationScreenState createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.currentPage;
  }
}


// class HomeScreenBottomBar extends StatefulWidget {
//   const HomeScreenBottomBar({Key? key}) : super(key: key);

//   @override
//   State<HomeScreenBottomBar> createState() => _HomeScreenBottomBarState();
// }

// class _HomeScreenBottomBarState extends State<HomeScreenBottomBar> {
//   int homeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     // debugPrint(" in home screen buttombar  ==>");
//     return Scaffold(
//       backgroundColor: kSecondaryColor,
//       body: homeIndex == 0 ? const HomeScreen() : const SettingScreen(),
//       bottomNavigationBar: Container(
//         height: MediaQuery.of(context).size.width * 0.16,
//         decoration: const BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(20),
//             topLeft: Radius.circular(20),
//           ),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               radius: 10,
//               onTap: () {
//                 homeIndex = 0;
//                 setState(() {});
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: homeIndex == 0 ? Colors.white : Colors.black,
//                   ),
//                   Text(
//                     "Home ",
//                     style: TextStyle(
//                       color: homeIndex == 0 ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () async {
//                 homeIndex = 1;
//                 setState(() {});
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.settings,
//                     color: homeIndex == 1 ? Colors.white : Colors.black,
//                   ),
//                   Text(
//                     "Setting",
//                     style: TextStyle(
//                       color: homeIndex == 1 ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
