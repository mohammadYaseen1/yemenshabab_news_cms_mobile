import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/gen/assets.gen.dart';
import 'package:yemenshabab/layout/layout_cubit.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/shared/component/animated_search_bar.dart';
import 'package:yemenshabab/views/about_us_screen.dart';
import 'package:yemenshabab/views/faq_screen.dart';
import 'package:yemenshabab/views/home/home_screen.dart';
import 'package:yemenshabab/views/main/drawer.dart';
import 'package:yemenshabab/views/privacy_screen.dart';
import 'package:yemenshabab/views/profile_screen.dart';
import 'package:yemenshabab/views/settings_screen.dart';
import 'package:yemenshabab/views/terms_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  Widget _screen = const HomeScreen();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {
          _screen = switch (state) {
            NavigationState.home => const HomeScreen(),
            NavigationState.aboutUs => const AboutUsScreen(),
            NavigationState.terms => const TermsScreen(),
            NavigationState.profile => const ProfileScreen(),
            NavigationState.settings => const SettingsScreen(),
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

  AdvancedDrawer buildAdvancedDrawer(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).drawerTheme.backgroundColor,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      openRatio: 0.65,
      animationDuration: const Duration(milliseconds: 300),
      rtlOpening: isArabic(context),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      drawer: DrawerList(controller: _advancedDrawerController),
      child: buildScreen(context),
    );
  }

  Scaffold buildScreen(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      body: _screen,
    );
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 65),
      child: SafeArea(
        child: AnimationSearchBar(
            centerIcon: Assets.images.logo.image(
              fit: BoxFit.contain,
              height: 70,
            ),
            isBackButtonVisible: false,
            onChanged: (text) {},
            onSubmit: (value) {},
            searchTextEditingController: _controller,
            horizontalPadding: 5),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
