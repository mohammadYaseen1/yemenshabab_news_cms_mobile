import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:yemenshabab_news_cms_mobile/app.dart';
import 'package:yemenshabab_news_cms_mobile/bloc_observer.dart';
import 'package:yemenshabab_news_cms_mobile/layout/navigation_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  tz.initializeTimeZones();
  Config.timeZoneName = await FlutterTimezone.getLocalTimezone();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => homeController.homeCubit,
        ),
      ],
      child: const App(),
    );
  }
}
