import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent(
      {super.key, required this.imageUrl, this.clickable = false});

  final String imageUrl;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: clickable
              ? WidgetZoom(
                  heroAnimationTag: Random().nextDouble().toString(),
                  closeFullScreenImageOnDispose: true,
                  zoomWidget: Image(image: imageProvider, fit: BoxFit.cover),
                )
              : null,
        );
      },
      placeholder: (context, url) => SizedBox(
          height: 250,
          child: const Center(child: CircularProgressIndicator.adaptive())),
      errorWidget: (context, url, error) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).cardColor),
              borderRadius: BorderRadius.circular(25)),
          height: 250,
          child:
              Center(child: Assets.images.logoGrey.image(fit: BoxFit.cover))),
    );
  }
}
