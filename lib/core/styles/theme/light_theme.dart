import 'package:flutter/material.dart';
import 'package:yemenshabab/core/constants/app_colors.dart';
import 'package:yemenshabab/gen/fonts.gen.dart';

/*
  "days": "{day, select, =sunday{{day} أحد} monday{{day} إثنين} tuesday{{day} ثلاثاء} wednesday{{day} أربعاء} thursday{{day} خميس} friday{{day} جمعة} saturday{{day} سبت}}"
*
* */

ThemeData lightTheme = ThemeData(
  fontFamily: FontFamily.notoSansArabic,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    surface: Colors.white,
    primary: Colors.red,
    secondary: Colors.grey.shade600,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    displaySmall: const TextStyle(
      color: AppColors.lightDefaultColor,
      fontSize: 14,
    ),
    headlineLarge: const TextStyle(
      color: AppColors.lightDefaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headlineMedium: const TextStyle(
      color: AppColors.appBlackColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headlineSmall: const TextStyle(
      color: AppColors.lightDefaultColor,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    bodyLarge: const TextStyle(
      color: AppColors.appBlackColor,
      fontSize: 18,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.lightDefaultColor,
      fontSize: 16,
    ),
    bodySmall: const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      color: AppColors.lightDefaultColor.withOpacity(0.4),
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: AppColors.lightDefaultColor.withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      color: AppColors.lightDefaultColor.withOpacity(0.4),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  ),
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
