import 'package:flutter/cupertino.dart';

class BottomNavModel {
  BottomNavModel({
    required this.icon,
    required this.title,
    required this.screen,
  });

  final IconData icon;
  final String title;
  final Widget Function([dynamic]) screen;
}
