import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

IconButton buildSocialMediaButton({
  required String url,
  required IconData icon,
  required BuildContext context,
  Color? iconColor,
}) =>
    IconButton(
      onPressed: () {
        _launchUrl(Uri.parse(url));
      },
      icon: Icon(
        icon,
        size: 32,
        color: iconColor ?? Theme.of(context).colorScheme.secondary,
      ),
    );

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
