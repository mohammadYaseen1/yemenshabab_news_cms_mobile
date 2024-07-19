import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingBouncingLine.square(
          itemBuilder: (context, index) => Assets.images.logo2Crop.image(),
          size: 120,
        ),
      ),
    );
  }

  Widget buildInkDrop(BuildContext context) {
    return LoadingAnimationWidget.inkDrop(
      color: Theme.of(context).colorScheme.primary,
      size: 50,
    );
  }
}
