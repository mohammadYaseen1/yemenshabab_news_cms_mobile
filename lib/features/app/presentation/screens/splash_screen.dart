// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yemenshabab/core/constants/app_images.dart';
// import 'package:yemenshabab/core/constants/app_sizes.dart';
// import 'package:yemenshabab/core/helper/cache_helper.dart';
// import 'package:yemenshabab/features/auth/presentation/screens/sign_in_screen.dart';
// import 'package:yemenshabab/layout/app_layout.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     bool isLogin = CacheHelper.getData(key: 'isLogin') ?? false;
//
//     Future.delayed(const Duration(seconds: 2), () {
//       return Get.off(isLogin ? const AppLayout() : const SignInScreen());
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     AppSizeConfig.init(context);
//     return Scaffold(
//       body: Center(
//         child: Image(
//           width: AppSizeConfig.screenWidth * 0.5,
//           height: AppSizeConfig.screenHeight * 0.3,
//           fit: BoxFit.fill,
//           image: const AssetImage(
//             AppImages.appLogo,
//           ),
//         ),
//       ),
//     );
//   }
// }
