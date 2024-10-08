import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/services/app/cubits/app_cubit.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/views/main/main_screen.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);

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
          return MainScreen();
        },
      ),
    );
  }
}
