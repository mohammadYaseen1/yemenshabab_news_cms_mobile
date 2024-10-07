import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/core/routes/app_routes.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/main/user_info_tile.dart';

class DrawerList extends StatefulWidget {
  // final DrawerData drawerData;

  DrawerList({
    super.key,
    // required this.drawerData,
  });

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 0, 50),
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            if (isLoggedIn && userInfo != null)
              UserInfoTile(
                avatarUrl: "https://www.w3schools.com/howto/img_avatar.png",
                name: userInfo!.name,
                username:  userInfo!.email,
                onTab: () {
                },
              ),
            const Spacer(flex: 10),
            ListTile(
              onTap: () {
                context.read<NavigationCubit>().selectHome();
                ZoomDrawer.of(context)!.toggle();
              },
              leading: const Icon(Icons.home_rounded),
              title: Text(AppLocalizations.of(context)!.home),
            ),
            ListTile(
              onTap: () {
                context.read<NavigationCubit>().selectAboutUs();
                ZoomDrawer.of(context)!.toggle();
              },
              leading: const Icon(Icons.description_rounded),
              title: Text(AppLocalizations.of(context)!.about_us),
            ),
            ListTile(
              onTap: () {
                context.read<NavigationCubit>().selectPrivacy();
                ZoomDrawer.of(context)!.toggle();
              },
              leading: const Icon(Icons.privacy_tip_rounded),
              title: Text(AppLocalizations.of(context)!.privacy_policy),
            ),
            ListTile(
              onTap: () {
                ZoomDrawer.of(context)!.toggle();
                context.read<NavigationCubit>().selectSettings();
              },
              leading: const Icon(Icons.settings_rounded),
              title: Text(AppLocalizations.of(context)!.settings),
            ),
            ListTile(
              onTap: () {
                customLaunchUrl(Uri.parse(Config.archiveSite));
                ZoomDrawer.of(context)!.toggle();
              },
              leading: Icon(
                FontAwesomeIcons.boxArchive,
                // color: "#d97706".toColor,
              ),
              title: Text(
                AppLocalizations.of(context)!.archive,
                style: TextStyle(
                    // color: "#d97706".toColor,
                    ),
              ),
            ),
            const Spacer(flex: 50),
            isLoggedIn
                ? ListTile(
                    onTap: () {
                      setState(() {
                        context
                            .read<SignInBloc>()
                            .add(SignUpEvent());
                      });
                    },
                    leading: const Icon(Icons.logout_outlined),
                    title: Text(AppLocalizations.of(context)!.logout),
                  )
                : ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.signIn);
                    },
                    leading: const Icon(Icons.login_outlined),
                    title: Text(AppLocalizations.of(context)!.login),
                  ),
            const Spacer(
              flex: 1,
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
                    Text('v${appInfo.version}'),
                    SizedBox(height: 5),
                    Text(AppLocalizations.of(context)!.copyright),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
