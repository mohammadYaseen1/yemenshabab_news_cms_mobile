import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/shared/component/custom_first_page_exception_indicator.dart';

class CustomFirstPageErrorIndicator extends StatelessWidget {
  const CustomFirstPageErrorIndicator({
    this.onTryAgain,
    super.key,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => CustomFirstPageExceptionIndicator(
        title: 'noInternet'.tr,
        buttonTitle: 'try_again'.tr,
        message: "${'noInternetDesc'.tr}\n${'and'.tr} ${'try_again'.tr}",
        onTryAgain: onTryAgain,
      );
}
