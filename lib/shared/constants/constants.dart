import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yemenshabab/data/models/home/home_model.dart';
import 'package:yemenshabab/services/home/controllers/home_controller.dart';
import 'package:yemenshabab/services/home/models/program/program_entity.dart';

class Constants {
  static const String baseUrl = 'https://api.example.com';
  static const int apiTimeOut = 60 * 1000;
}

enum themeColor { error, warning, success, info, background }

enum ToastTheme { error, warning, success, info }

String uuid = '';
bool isLoggedIn = false;
bool isGuest = true;
bool isOpen = false;
int categoryIndex = -1;
bool isLoadedLanding = false;
ProgramEntity? programEntity;
HomeModel? homeModelConst;
late TabController tabController;
WebViewController? viewController;
final HomeController homeController = HomeController();

