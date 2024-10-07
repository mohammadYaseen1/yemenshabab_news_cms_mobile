import 'package:flutter/material.dart';
import 'package:yemenshabab/core/constants/app_colors.dart';
import 'package:yemenshabab/core/extension/string.dart';
import 'package:yemenshabab/gen/fonts.gen.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: FontFamily.notoSansArabic,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.red,
    secondary: Colors.grey,
  ),
  scaffoldBackgroundColor: "#262626".toColor,
  drawerTheme: DrawerThemeData(
    backgroundColor: "#525252".toColor,
  ),
  primaryColor: Colors.red,
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
    displaySmall: const TextStyle(
      color: AppColors.darkDefaultColor,
      fontSize: 14,
    ),
    headlineLarge: const TextStyle(
      color: AppColors.appLightColor,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headlineMedium: const TextStyle(
      color: AppColors.appLightColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headlineSmall: const TextStyle(
      color: AppColors.darkDefaultColor,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    bodyLarge: const TextStyle(
      color: AppColors.appWhiteColor,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 16,
    ),
    bodySmall: const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      color: AppColors.darkDefaultColor.withOpacity(0.4),
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: AppColors.darkDefaultColor.withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      color: AppColors.darkDefaultColor.withOpacity(0.4),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: "#525252".toColor,
  ),
  cardColor: "#525252".toColor,
  toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: '#525252'.toColor, color: '#000000'.toColor),
);
