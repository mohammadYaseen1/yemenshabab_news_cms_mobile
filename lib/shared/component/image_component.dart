import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';
import 'package:yemenshabab/gen/assets.gen.dart';
import 'package:yemenshabab/shared/utils.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    required this.imageUrl,
    this.clickable = false,
    this.height = 250,
  });

  final String imageUrl;
  final bool clickable;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
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
          height: height,
          child: const Center(child: CircularProgressIndicator.adaptive())),
      errorWidget: (context, url, error) {
        debugPrint("error loadImage: \n error: $error, \n url: $url");
        deleteImageFromCache(url);
        return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).cardColor),
                borderRadius: BorderRadius.circular(15)),
            height: height,
            child:
                Center(child: Assets.images.logoGrey.image(fit: BoxFit.cover)));
      },
    );
  }
}
