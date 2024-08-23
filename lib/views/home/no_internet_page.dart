import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/gen/assets.gen.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.logoGrey.image(width: 150),
            const SizedBox(height: 30),
            Text(
              'noInternet'.tr,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'noInternetDesc',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 50),
            FilledButton.tonalIcon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary),
              ),
              onPressed: () async {
                await appController.appCubit.fetchSettings();
                await homeController.homeCubit
                    .fetchAll(Localizations.localeOf(context).languageCode);
              },
              label: Text('try_again'.tr),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
