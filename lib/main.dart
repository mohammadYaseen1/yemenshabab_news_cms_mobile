import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:yemenshabab/app.dart';
import 'package:yemenshabab/bloc_observer.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/shared/config/config.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/shared/local/cache_helper.dart';

const String appId = '0d941047-04fd-45e5-86b8-37f4bf5e9d0b';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(appId);
  OneSignal.Notifications.requestPermission(true);

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
