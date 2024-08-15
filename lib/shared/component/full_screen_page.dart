import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/src/controller/youtube_player_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class FullScreenPage extends StatelessWidget {
  const FullScreenPage(this.controller, {super.key});

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      enableFullScreenOnVerticalDrag: true,
      autoFullScreen: true,
      fullscreenOrientations: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
      ],
      controller: controller,
      builder: (context, player) {
        return SizedBox(
          width: double.infinity,
          child: player,
        );
      },
    );
  }
}
