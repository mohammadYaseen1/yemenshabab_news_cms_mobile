import 'package:flutter/material.dart';

class DrawerData {
  DrawerData({
    required UserData userData,
    required List<ScreenData> mainScreens,
    required List<ScreenData> secondaryScreens,
  }) {
    _userData = userData;
    _mainScreens = mainScreens;
    _secondaryScreens = secondaryScreens;
  }

  UserData? _userData;
  List<ScreenData>? _mainScreens;
  List<ScreenData>? _secondaryScreens;

  UserData get userData => _userData!;

  List<ScreenData> get mainScreens => _mainScreens!;

  List<ScreenData> get secondaryScreens => _secondaryScreens!;
}

class UserData {
  UserData({
    required String name,
    required String img,
    required String username,
  }) {
    _name = name;
    _img = img;
    _username = username;
  }

  String? _name;
  String? _img;
  String? _username;

  String get name => _name!;

  String get username => _username!;

  String get img => _img!;
}

class ScreenData {
  ScreenData({
    required String title,
    required Icons icon,
  }) {
    _title = title;
    _icon = icon;
  }

  String? _title;
  Icons? _icon;

  String get title => _title!;

  Icons get icon => _icon!;
}
