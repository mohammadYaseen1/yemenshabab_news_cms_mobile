import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/constants/app_sizes.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/styles/theme/dark_theme.dart';
import 'package:yemenshabab/core/styles/theme/light_theme.dart';
import 'package:yemenshabab/core/translations/app_translation.dart';
import 'package:yemenshabab/features/app/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:yemenshabab/features/app/presentation/bloc/theme_bloc/theme_state.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';

import 'core/routes/app_routes.dart';
import 'features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'services/home/cubits/home_cubit.dart';

class App extends StatelessWidget {
  final String language;
  final String theme;

  const App({
    super.key,
    required this.theme,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            appTheme: theme,
            context: context,
          ),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(create: (_) => SignInBloc()),
        BlocProvider(create: (_) => SignUpBloc()),
        BlocProvider<HomeCubit>(
          create: (context) => homeController.homeCubit,
        ),
        BlocProvider(create: (_) => appController.appCubit..fetchSettings()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'يمن شباب',
            locale: Locale(language),
            fallbackLocale: Locale(language),
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            translations: AppTranslation(),
            themeMode: state.themeMode,
            initialRoute: '/',
            getPages: AppRoutes.getPages,
          );
        },
      ),
    );
  }
}
