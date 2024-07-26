import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/extension/string.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    this.bottom,
    required this.body,
    this.actions = const [],
    this.leading,
    this.pinned = true,
    this.static = false,
  });

  final PreferredSizeWidget? bottom;
  final Widget body;
  final List<Widget> actions;
  final Widget? leading;
  final bool pinned;
  final bool static;
  late List<Widget> defaultActions;

  @override
  Widget build(BuildContext context) {
    buildDefaultActions(context);
    return static
        ? Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(73.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: AppBar(
                    toolbarHeight: 90,
                    title: getLogo(),
                    centerTitle: true,
                    actions: [
                      ...defaultActions,
                      ...actions,
                    ],
                  ),
                )),
            body: body,
          )
        : NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: SliverAppBar(
                  toolbarHeight: 80,
                  title: getLogo(),
                  surfaceTintColor: Theme.of(context).cardColor,
                  shadowColor: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
                      : null,
                  centerTitle: true,
                  floating: true,
                  pinned: pinned,
                  snap: true,
                  bottom: bottom,
                  actions: [...defaultActions, ...actions],
                ),
              ),
            ],
            body: body,
          );
  }

  Image getLogo() => Assets.images.logo.image(
        fit: BoxFit.contain,
        height: 65,
      );

  void buildDefaultActions(BuildContext context) => defaultActions = [
        TextButton(
          onPressed: () {
            customLaunchUrl(Uri.parse(Config.archiveSite));
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStateColor.transparent,
            overlayColor: WidgetStateColor.transparent,
            foregroundColor: WidgetStateColor.transparent,
          ),
          child: Text(
            AppLocalizations.of(context)!.archive,
            style: TextStyle(
              color: "#d97706".toColor,
            ),
          ),
        ),
      ];
}
