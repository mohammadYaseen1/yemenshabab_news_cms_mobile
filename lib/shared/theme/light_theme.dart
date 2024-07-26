import 'package:flutter/material.dart';
import 'package:yemenshabab/gen/fonts.gen.dart';

/*
  "days": "{day, select, =sunday{{day} أحد} monday{{day} إثنين} tuesday{{day} ثلاثاء} wednesday{{day} أربعاء} thursday{{day} خميس} friday{{day} جمعة} saturday{{day} سبت}}"
*
* */

ThemeData lightTheme = ThemeData(
  fontFamily: FontFamily.notoSansArabic,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    surface: Colors.white,
    primary: Colors.red,
    secondary: Colors.grey.shade600,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
      bodySmall: TextStyle(
    color: Colors.grey,
  )),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey.shade400,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    // backgroundColor: "#D3D3D3".toColor,
    unselectedItemColor: Colors.grey.shade500,
  ),
  cardColor: Colors.grey.shade50,
  toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: Colors.grey.shade50, color: Colors.white),
);
