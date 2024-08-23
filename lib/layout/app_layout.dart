import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:yemenshabab/services/app/cubits/app_cubit.dart';
import 'package:yemenshabab/views/main/main_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = CacheHelper.getData(key: 'isLogin') ?? false;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return isLogin ? const MainScreen() : const SignInScreen();
      },
    );
  }
}
