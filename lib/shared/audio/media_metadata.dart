import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';

class MediaMetaData extends StatelessWidget {
  const MediaMetaData({
    super.key,
    required this.image,
    required this.title,
    required this.artist,
  });

  final String image;
  final String title;
  final String artist;
  final imageSize = 180.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.logo2Crop.image(
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          artist,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
