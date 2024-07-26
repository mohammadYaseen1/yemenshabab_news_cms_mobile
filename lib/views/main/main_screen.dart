import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';
import 'package:yemenshabab_news_cms_mobile/layout/layout_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/layout/navigation_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/animated_search_bar.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/about_us_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/faq_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/home_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/main/drawer.dart';
import 'package:yemenshabab_news_cms_mobile/views/privacy_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/profile_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/settings_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/terms_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _advancedDrawerController = AdvancedDrawerController();
  Widget _screen = HomeScreen();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {
          _screen = switch (state) {
            NavigationState.home => HomeScreen(),
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
