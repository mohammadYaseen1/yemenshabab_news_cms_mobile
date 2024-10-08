import 'package:flutter/material.dart';
import 'package:yemenshabab/gen/fonts.gen.dart';
import 'package:yemenshabab/shared/extension/string.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: FontFamily.notoSansArabic,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.red,
    secondary: Colors.grey,
  ),
  scaffoldBackgroundColor: "#262626".toColor,
  drawerTheme: DrawerThemeData(
    backgroundColor: "#525252".toColor,
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.white,
    color: "#262626".toColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: "#262626".toColor.withOpacity(0.9),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: "#525252".toColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: "#525252".toColor,
  ),
  cardColor: "#525252".toColor,
  toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: '#525252'.toColor, color: '#000000'.toColor),
);
