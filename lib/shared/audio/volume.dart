import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Volume extends StatelessWidget {
  const Volume({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;
  final iconSize = 80.0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: audioPlayer.play,
            iconSize: iconSize,
            icon: Icon(Icons.play_arrow_rounded),
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: audioPlayer.pause,
            iconSize: iconSize,
            icon: Icon(Icons.pause_rounded),
          );
        }
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: audioPlayer.load,
          iconSize: iconSize,
          icon: Icon(Icons.refresh_rounded),
        );
      },
    );
  }
}
