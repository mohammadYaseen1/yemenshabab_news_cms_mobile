import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var tabs = [
      TabData(
        index: 1,
        title: const Tab(
          child: Text('Tab 1'),
        ),
        content: const Center(child: Text('Content for Tab 1')),
      ),
    ];

    final iconList = <IconData>[
          Icons.home_filled,
          Icons.ondemand_video_rounded,
          Icons.bookmark_rounded,
          Icons.person_2_rounded,
    ];

    var _bottomNavIndex = 0; //default index of a first screen

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_rounded),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: [
      //     Icons.home_filled,
      //     Icons.ondemand_video_rounded,
      //     Icons.bookmark_rounded,
      //     Icons.person_2_rounded,
      //   ],
      //   activeIndex: 0,
      //   activeColor: Colors.blue,
      //   inactiveColor: Colors.grey,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   backgroundColor: Colors.red,
      //   // leftCornerRadius: 32,
      //   // rightCornerRadius: 32,
      //   height: 60,
      //   elevation: 50,
      //   onTap: (index) {},
      //   //other params
      // ),

      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.red : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "brightness $index",
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        // notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {},
      ),
      body: DynamicTabBarWidget(
        dynamicTabs: tabs,
        labelStyle: TextStyle(fontWeight: FontWeight.w900),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.red,
        isScrollable: true,
        dividerHeight: 0.5,
        tabAlignment: TabAlignment.start,
        onTabControllerUpdated: (controller) {
          debugPrint("onTabControllerUpdated");
        },
        onTabChanged: (index) {
          debugPrint("Tab changed: $index");
        },
        showBackIcon: false,
        showNextIcon: false,
        indicatorColor: Colors.red,
        automaticIndicatorColorAdjustment: true,
      ),
    );
  }
}
