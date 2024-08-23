import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';

class DrawerList extends StatelessWidget {
  final AdvancedDrawerController controller;

  // final DrawerData drawerData;

  const DrawerList({
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
                title: Text('home'.tr),
              ),
              ListTile(
                onTap: () {
                  // controller.toggleDrawer();
                  context.read<NavigationCubit>().selectSettings();
                },
                leading: const Icon(Icons.settings_rounded),
                title: Text('settings'.tr),
              ),
              ListTile(
                onTap: () {
                  controller.hideDrawer();
                  context.read<NavigationCubit>().selectAboutUs();
                },
                leading: const Icon(Icons.description_rounded),
                title: Text('about_us'.tr),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectTerms();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.settings),
                title: Text('terms_conditions'.tr),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectPrivacy();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.settings),
                title: Text('privacy_policy'.tr),
              ),
              ListTile(
                onTap: () {
                  context.read<NavigationCubit>().selectFaq();
                  controller.hideDrawer();
                },
                leading: const Icon(Icons.question_mark_rounded),
                title: Text('faq'.tr),
              ),
              const Spacer(
                flex: 3,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.brightness_4_outlined),
                title: Text('theme'.tr),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.translate_rounded),
                title: Text('language'.tr),
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
                      const Text("v1.0"),
                      const SizedBox(height: 5),
                      Text('copyright'.tr),
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
