import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yemenshabab/shared/config/config.dart';
import 'package:yemenshabab/shared/utils/utils.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await Share.share(url,
              subject: (isArabic(context)
                      ? Config.settings?.siteName
                      : Config.settings?.siteNameEn) ??
                  '');
        },
        icon: const Icon(Icons.share_rounded));
  }
}
