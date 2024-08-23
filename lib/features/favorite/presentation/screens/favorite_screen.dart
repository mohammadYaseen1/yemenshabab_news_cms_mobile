import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/shared/widget/base_sub_widget.dart';
import 'package:yemenshabab/shared/widget/news_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSubWidget(
      title: 'Favorite'.tr,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        itemBuilder: (context, index) => NewsWidget(
          isFavorite: false,
          valueChanged: (value) {},
          onTap: () {},
          onPressedFav: () {},
          title: 'test',
          time: '18/6/2000',
          imageUrl:
              'https://yemenshabab-spaces.fra1.cdn.digitaloceanspaces.com/images/75cd6a4d17784c5e8e19d5bf0985d251.jpeg',
        ),
      ),
    );
  }
}
