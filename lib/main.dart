import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:yemenshabab/app.dart';
import 'package:yemenshabab/bloc_observer.dart';
import 'package:yemenshabab/core/constants/app_sizes.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/core/utils/firebase_options.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/features/favorite/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/shared/config/config.dart';

import 'core/utils/injections.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appInfo = await PackageInfo.fromPlatform();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize(appId);
  // OneSignal.Notifications.requestPermission(true);

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.initInjections();
  tz.initializeTimeZones();
  Config.timeZoneName = await FlutterTimezone.getLocalTimezone();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(create: (_) => di.sl<SignInBloc>()),
        BlocProvider(create: (_) => di.sl<SignUpBloc>()),
        BlocProvider(create: (_) => di.sl<FavoriteBloc>()),
        BlocProvider<HomeCubit>(create: (context) => homeController.homeCubit),
        BlocProvider(create: (_) => appController.appCubit..fetchSettings()),
      ],
      child: const App(),
    );
  }
}
