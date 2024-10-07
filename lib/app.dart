import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yemenshabab/layout/app_layout.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/shared/local/cache_helper.dart';
import 'package:yemenshabab/shared/theme/dark_theme.dart';
import 'package:yemenshabab/shared/theme/light_theme.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  static _AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = Locale(CacheHelper.getData(key: 'local') ?? 'en');
  ThemeMode _themeMode =
      ThemeMode.values[CacheHelper.getData(key: 'theme') ?? 0];

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
      CacheHelper.setData(key: 'local', value: value.languageCode);
      homeController.homeCubit..fetchLanding(value.languageCode, false);
    });
  }

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode value) {
    setState(() {
      _themeMode = value;
      CacheHelper.setData(key: 'theme', value: value.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'يمن شباب',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => AppLayout(),
      },
    );
  }
}
