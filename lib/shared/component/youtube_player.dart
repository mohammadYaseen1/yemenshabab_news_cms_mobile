import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYouTubePlayer extends StatefulWidget {
  final String id;
  final bool popup;

  const CustomYouTubePlayer({super.key, required this.id, this.popup = false});

  @override
  _CustomYouTubePlayerState createState() => _CustomYouTubePlayerState();
}

class _CustomYouTubePlayerState extends State<CustomYouTubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.id,
      autoPlay: false,
      params: YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: !widget.popup,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pauseVideo();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      enableFullScreenOnVerticalDrag: true,
      fullscreenOrientations: [],
      autoFullScreen: true,
      controller: _controller,
      builder: (context, player) {
        return SizedBox(
          width: double.infinity,
          child: player,
        );
      },
    );
  }
}
