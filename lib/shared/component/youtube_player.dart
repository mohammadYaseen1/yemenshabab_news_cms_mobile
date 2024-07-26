import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemenshabab/shared/component/youtube_player_full.dart';
import 'package:yemenshabab/shared/component/youtube_view.dart';
import 'package:yemenshabab/shared/utils.dart';
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
    print("initState");
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
  //
  @override
  void deactivate() {
    print("deactivate");
    _controller.pauseVideo();
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    _controller.close();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    print("build123");
    print(widget.id);
    return YoutubeView(id: widget.id);
    return YoutubePlayerScaffold(
      fullscreenOrientations: [],
      controller: _controller,
      builder: (context, player) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              player,
              InkWell(
                onTap: () {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeRight,
                    DeviceOrientation.landscapeLeft,
                  ]);
                  Navigator.of(context).push(createRoute(
                    () => CustomYouTubePlayerFull( controller: _controller),
                  ));
                  print("onTap");
                },
                child: Container(
                  height: 40,
                  width: 55,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
