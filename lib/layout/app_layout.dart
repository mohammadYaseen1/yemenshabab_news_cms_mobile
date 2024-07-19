import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/controllers/app_controller.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/cubits/app_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/loading.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/views/main/main_screen.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);

  final AppController appController = AppController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => appController.appCubit..fetchSettings()),
        BlocProvider(
          create: (_) => homeController.homeCubit
            ..fetchAll(Localizations.localeOf(context).toLanguageTag()),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BuildCondition(
            condition: isLoggedIn || isGuest,
            builder: (_) => MainScreen(),
            fallback: (_) => const LoadingScreen(),
          );
        },
      ),
    );
  }
}
