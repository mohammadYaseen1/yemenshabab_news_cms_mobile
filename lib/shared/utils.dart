import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/extension/string.dart';
import 'package:yemenshabab/gen/assets.gen.dart';

Future<String> loadJsonData() async {
  String jsonData = await rootBundle.loadString('assets/data.json');
  return jsonData;
}

void parseJsonData() async {
  String jsonData = await loadJsonData();
  Map<String, dynamic> data = json.decode(jsonData);
}

Route createRoute(Widget Function() page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createSideRoute(Widget Function() page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future deleteImageFromCache(String url) async {
  await CachedNetworkImage.evictFromCache(url);
  debugPrint("clear cache [$url]");
}

PreferredSize buildAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70.0),
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
            customLaunchUrl(Uri.parse(Config.archiveSite));
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStateColor.transparent,
            overlayColor: WidgetStateColor.transparent,
            foregroundColor: WidgetStateColor.transparent,
          ),
          child: Text(
            'archive'.tr,
            style: TextStyle(
              color: "#d97706".toColor,
            ),
          ),
        )
      ],
    ),
  );
}

Future<void> customLaunchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
