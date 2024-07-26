import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yemenshabab/shared/audio/audio_player_management.dart';
import 'package:yemenshabab/shared/audio/controls.dart';
import 'package:yemenshabab/shared/audio/position_data.dart';
import 'package:yemenshabab/shared/config/config.dart';
import 'package:yemenshabab/shared/utils/utils.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key, required this.url});

  final String url;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playList;
  late ThemeData _theme;
  String artist = '';

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (Duration position, Duration bufferedPosition, Duration? duration) =>
            PositionData(
          position: position,
          bufferedPosition: bufferedPosition,
          duration: duration ?? Duration.zero,
        ),
      );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    artist = AppLocalizations.of(context)!.audioBroadcast;
    _theme = Theme.of(context);
    _init();
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayerManager().audioPlayer;
  }

  Future<void> _init() async {
    _playList = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(
          Uri.parse(widget.url),
          tag: MediaItem(
            id: '0',
            title: (isArabic(context)
                    ? Config.settings?.siteName
                    : Config.settings?.siteNameEn) ??
                '',
            artUri:
                Uri.parse('https://yemenshabab.org/assets/images/logo-ys.png'),
          ),
        )
      ],
    );
    await _audioPlayer.setAudioSource(_playList);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Controls(audioPlayer: _audioPlayer);
  }
}
