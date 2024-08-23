import 'package:get/get.dart';
import 'package:yemenshabab/features/app/presentation/screens/splash_screen.dart';
import 'package:yemenshabab/features/auth/presentation/screens/otp_screen.dart';
import 'package:yemenshabab/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:yemenshabab/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:yemenshabab/layout/app_layout.dart';
import 'package:yemenshabab/views/main/main_screen.dart';

// App Routes
class AppRoutes {
  static const String base = '/';
  static const String main = '/main';
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String otp = '/otp';

  static List<GetPage> getPages = [
    GetPage(name: base, page: () => const AppLayout()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: otp, page: () => const OTPScreen()),
    GetPage(name: main, page: () => const MainScreen()),
  ];
}
