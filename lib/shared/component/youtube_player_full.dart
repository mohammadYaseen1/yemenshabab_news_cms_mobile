import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYouTubePlayerFull extends StatefulWidget {
  final YoutubePlayerController controller;

  const CustomYouTubePlayerFull({super.key, required this.controller});

  @override
  State<CustomYouTubePlayerFull> createState() =>
      _CustomYouTubePlayerFullState();
}

class _CustomYouTubePlayerFullState extends State<CustomYouTubePlayerFull> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void play() async {
    await widget.controller.playVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerScaffold(
        key: UniqueKey(),
        controller: widget.controller,
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
