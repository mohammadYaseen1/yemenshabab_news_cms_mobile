import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:yemenshabab/app.dart';
import 'package:yemenshabab/bloc_observer.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/core/utils/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  tz.initializeTimeZones();

  Config.timeZoneName = await FlutterTimezone.getLocalTimezone();

  Bloc.observer = MyBlocObserver();

  String language = await CacheHelper.getData(key: 'lang') ?? 'en';
  String theme = await CacheHelper.getData(key: 'theme') ?? 'light';

  runApp(App(
    theme: theme,
    language: language,
  ));
}
