import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';
import 'package:yemenshabab_news_cms_mobile/layout/layout_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/layout/navigation_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/animated_search_bar.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/extension/string.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/about_us_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/faq_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/home_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/main/drawer.dart';
import 'package:yemenshabab_news_cms_mobile/views/privacy_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/profile_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/search_page.dart';
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
      appBar: buildAppBar(context),
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

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
          toolbarHeight: 150,
          title: Center(
            child: Assets.images.logo.image(
              fit: BoxFit.contain,
              height: 65,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _launchUrl(Uri.parse(Config.archiveSite));
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.transparent,
                overlayColor: WidgetStateColor.transparent,
                foregroundColor: WidgetStateColor.transparent,
                // splashColor: Colors.transparent,
                // hoverColor: Colors.transparent,
                // focusColor: Colors.transparent,
                // highlightColor: Colors.transparent,
              ),
              child: Text(
                AppLocalizations.of(context)!.archive,
                style: TextStyle(
                  color: "#d97706".toColor,
                ),
              ),
            )
          ],
          leading: true
              ? SizedBox()
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).push(createSideRoute(
                      () => SearchPage(),
                    ));
                  },
                  icon: Icon(FontAwesomeIcons.magnifyingGlass))),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
