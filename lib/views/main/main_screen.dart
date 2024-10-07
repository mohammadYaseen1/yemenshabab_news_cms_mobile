import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:yemenshabab/layout/layout_cubit.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/about_us_screen.dart';
import 'package:yemenshabab/views/faq_screen.dart';
import 'package:yemenshabab/views/home/home_screen.dart';
import 'package:yemenshabab/views/main/drawer.dart';
import 'package:yemenshabab/views/privacy_screen.dart';
import 'package:yemenshabab/views/profile_screen.dart';
import 'package:yemenshabab/views/settings_page.dart';
import 'package:yemenshabab/views/terms_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {
          screen = switch (state) {
            NavigationState.home => HomeScreen(),
            NavigationState.aboutUs => const AboutUsScreen(),
            NavigationState.terms =>  TermsScreen(),
            NavigationState.profile => const ProfileScreen(),
            NavigationState.settings => const SettingsPage(),
            NavigationState.faq => const FaqScreen(),
            NavigationState.privacy => const PrivacyScreen(),
          };
        },
        builder: (BuildContext context, NavigationState state) {
          return buildScreen(context);
        },
      ),
    );
  }

  Scaffold buildScreen(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      body: buildZoomDrawer(context),
    );
  }

  ZoomDrawer buildZoomDrawer(BuildContext context) {
    return ZoomDrawer(
      isRtl: isArabic(context),
      menuScreen: Builder(
        builder: (context) {
          return DrawerList();
        },
      ),
      duration: const Duration(milliseconds: 500),
      mainScreen: screen,
      borderRadius: 30.0,
      // showShadow: true,
      angle: 0.0,
      menuBackgroundColor: Theme.of(context).colorScheme.secondary,
      slideWidth: MediaQuery.of(context).size.width * 0.66,

      mainScreenScale: 0.1,
      openCurve: Curves.easeInToLinear,
      closeCurve: Curves.easeInToLinear,
    );
  }
}
