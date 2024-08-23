import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:toastification/toastification.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/component/toast.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/live_screen.dart';
import 'package:yemenshabab/views/home/no_internet_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              description: state.description!
                          .isCaseInsensitiveContains('network') ||
                      state.description!.isCaseInsensitiveContains('connection')
                  ? "noInternet".tr
                  : state.description,
              toastType: ToastificationType.error);
        }
      },
      builder: (context, state) {
        return state is LandingLoaded
            ? Scaffold(
                extendBody: true,
                floatingActionButton: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    Navigator.push(
                        context, createRoute(() => const LiveScreen()));
                  },
                  child: const Icon(Icons.play_arrow_rounded),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          homeController.homeCubit
                              .bottomNavData(context)[index]
                              .icon,
                          size: 24,
                          color: color,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          constraints:
                              const BoxConstraints(maxWidth: double.infinity),
                          child: AutoSizeText(
                            homeController.homeCubit
                                .bottomNavData(context)[index]
                                .title,
                            maxLines: 1,
                            minFontSize: 5,
                            style: TextStyle(color: color),
                          ),
                        )
                      ],
                    );
                  },
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  borderColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  shadow: Shadow(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.1)
                        : Colors.transparent,
                    blurRadius: 50,
                  ),

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
            : state is LandingLoading
                ? const LoadingScreen()
                : const NoInternetPage();
      },
    );
  }
}
