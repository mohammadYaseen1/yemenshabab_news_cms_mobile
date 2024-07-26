import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
    this.iconColor,
    this.iconSize = 80.0,
  });

  final AudioPlayer audioPlayer;
  final double iconSize;
  final Color? iconColor;

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
            color: iconColor,
            iconSize: iconSize,
            icon: const Icon(Icons.play_arrow_rounded),
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: audioPlayer.pause,
            color: iconColor,
            iconSize: iconSize,
            icon: const Icon(Icons.pause_rounded),
          );
        }
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: audioPlayer.load,
          color: iconColor,
          iconSize: iconSize,
          icon: const Icon(Icons.refresh_rounded),
        );
      },
    );
  }
}
