import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';

class DrawerList extends StatelessWidget {
  final AdvancedDrawerController controller;

  // final DrawerData drawerData;

  DrawerList({
    super.key,
    required this.controller,
    // required this.drawerData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 0, 50),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(flex: 1),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectHome();
                  // controller.hideDrawer();
                },
                leading: const Icon(Icons.home_rounded),
                title: Text(AppLocalizations.of(context)!.home),
              ),
              ListTile(
                onTap: () {
                  // controller.toggleDrawer();
                  context.read<NavigationCubit>().selectSettings();
                },
                leading: const Icon(Icons.settings_rounded),
                title: Text(AppLocalizations.of(context)!.settings),
              ),
              ListTile(
                onTap: () {
                  controller.hideDrawer();
                  context.read<NavigationCubit>().selectAboutUs();
                },
                leading: const Icon(Icons.description_rounded),
                title: Text(AppLocalizations.of(context)!.about_us),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectTerms();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.settings),
                title: Text(AppLocalizations.of(context)!.terms_conditions),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectPrivacy();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.settings),
                title: Text(AppLocalizations.of(context)!.privacy_policy),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectFaq();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.question_mark_rounded),
                title: Text(AppLocalizations.of(context)!.faq),
              ),
              const Spacer(
                flex: 3,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.brightness_4_outlined),
                title: Text(AppLocalizations.of(context)!.theme),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.translate_rounded),
                title: Text(AppLocalizations.of(context)!.language),
              ),
              const Spacer(
                flex: 3,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 25.0,
                  ),
                  child: Column(
                    children: [
                      Text("v1.0"),
                      SizedBox(height: 5),
                      Text(AppLocalizations.of(context)!.copyright),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
