import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/youtube_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYouTubePlayerFull extends StatelessWidget {
  final YoutubePlayerController controller;

  const CustomYouTubePlayerFull({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerScaffold(
        controller: controller,
        builder: (context, player) {
          return SizedBox(
            width: double.infinity,
            child: player,
          );
        },
      ),
    );
  }
}
