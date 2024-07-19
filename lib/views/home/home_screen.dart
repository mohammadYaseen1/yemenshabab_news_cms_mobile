import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/loading.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/toast.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/live_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is LandingError) {
          toast(
              context: context,
              title: state.message,
              description: state.description,
              toastType: ToastificationType.error);
        }
      },
      builder: (context, state) {
        return state is LandingLoaded
            ? Scaffold(
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.play_arrow_rounded),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        createRoute(
                          () => LiveScreen()
                        ));
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                  itemCount:
                      homeController.homeCubit.bottomNavData(context).length,
                  tabBuilder: (int index, bool isActive) {
                    final color = isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          homeController.homeCubit
                              .bottomNavData(context)[index]
                              .icon,
                          size: 24,
                          color: color,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          homeController.homeCubit
                              .bottomNavData(context)[index]
                              .title,
                          maxLines: 1,
                          style: TextStyle(color: color, fontSize: 12),
                        )
                      ],
                    );
                  },
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  activeIndex: activeIndex,
                  // notchAndCornersAnimation: borderRadiusAnimation,
                  splashSpeedInMilliseconds: 300,
                  notchSmoothness: NotchSmoothness.softEdge,
                  gapLocation: GapLocation.center,
                  onTap: (index) => setState(() {
                    activeIndex = index;
                  }),
                ),
                body: homeController.homeCubit
                    .bottomNavData(context)[activeIndex]
                    .screen(state.props.first),
              )
            : LoadingScreen();
      },
    );
  }
}
