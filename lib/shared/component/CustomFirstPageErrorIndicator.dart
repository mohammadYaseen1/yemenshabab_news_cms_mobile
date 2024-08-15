import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab/shared/component/custom_first_page_exception_indicator.dart';

class CustomFirstPageErrorIndicator extends StatelessWidget {
  const CustomFirstPageErrorIndicator({
    this.onTryAgain,
    super.key,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => CustomFirstPageExceptionIndicator(
        title: AppLocalizations.of(context)!.noInternet,
        buttonTitle: AppLocalizations.of(context)!.try_again,
        message:
            "${AppLocalizations.of(context)!.noInternetDesc}\n${AppLocalizations.of(context)!.and} ${AppLocalizations.of(context)!.try_again}",
        onTryAgain: onTryAgain,
      );
}
