import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yemenshabab/data/models/home/home_model.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/services/app/controllers/app_controller.dart';
import 'package:yemenshabab/services/home/controllers/home_controller.dart';
import 'package:yemenshabab/services/home/models/program/program_entity.dart';
import 'package:yemenshabab/views/home/home_screen.dart';

class Constants {
  static const String baseUrl = 'https://api.example.com';
  static const int apiTimeOut = 60 * 1000;
}

enum themeColor { error, warning, success, info, background }

enum ToastTheme { error, warning, success, info }

List<String> adsLayouts = ["L_MAB", "L_SAB"];

String uuid = '';
bool isLoggedIn = false;
UserInfo? userInfo;
bool isGuest = true;
bool isOpen = false;
int categoryIndex = -1;
bool isLoadedLanding = false;
ProgramEntity? programEntity;
HomeModel? homeModelConst;
late TabController tabController;
WebViewController? viewController;
final HomeController homeController = HomeController();
final AppController appController = AppController();
Widget screen = HomeScreen();
PackageInfo appInfo = PackageInfo(
  appName: "yemenshabab",
  packageName: "yemenshabab",
  version: "v1.0.0",
  buildNumber: "1.0.0",
);
