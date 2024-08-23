import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/utils/utils.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.url});

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
