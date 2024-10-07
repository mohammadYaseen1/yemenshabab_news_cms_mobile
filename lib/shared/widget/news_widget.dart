import 'package:auto_size_text/auto_size_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/shared/component/image_component.dart';

class NewsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isFavorite;
  final void Function()? onTap;
  final void Function()? onPressedFav;
  final Function valueChanged;

  const NewsWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.imageUrl,
    required this.onPressedFav,
    required this.isFavorite,
    required this.valueChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsetsDirectional.only(top: 20),
      child: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 20),
              width: 250,
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ImageComponent(
                      imageUrl: imageUrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: FavoriteButton(
                  iconSize: 25,
                  isFavorite: false,
                  iconDisabledColor: Colors.grey,
                  valueChanged: valueChanged,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
