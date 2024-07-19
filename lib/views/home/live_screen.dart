import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:qyplayer/interface/qyplayer_interface.dart';
import 'package:qyplayer/qyplayer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yemenshabab_news_cms_mobile/shared/audio/audio_player_management.dart';
import 'package:yemenshabab_news_cms_mobile/shared/audio/audio_player_widget.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/web_view.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/social_media.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';

class LiveScreen extends StatefulWidget {
  LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  int value = 0;

  GlobalKey<QYPlayerState> playerKey = GlobalKey<QYPlayerState>();

  late QYPlayerController? controller;
  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = QYPlayerController(
      src: Config.settings!.liveStreamUrl!,
      width: MediaQuery.of(context).size.width,
      height: 250,

      poster: 'https://yemenshabab.org/assets/images/logo-ys.png',
      isLive: true,
      autoplay: true,
      // useSafeArea: true,
      bgColor: Colors.white,
      defaultPlaybackRates: [
        const QYPlayerPlaybackRate('5.0X', 5.0),
        const QYPlayerPlaybackRate('4.0X', 4.0),
        const QYPlayerPlaybackRate('3.0X', 3.0),
        const QYPlayerPlaybackRate('2.0X', 2.0),
        const QYPlayerPlaybackRate('1.0X', 1.0),
      ],
    );
    _init();
  }

  late List<Widget> streamView;
  late Floating floating;

  @override
  void initState() {
    super.initState();
    _audioPlayer =  AudioPlayer();
    floating = Floating();
    streamView = [liveStream(), audioBroadcast()];
    enable();
  }

  Future<void> _init() async {
    _playList = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(
          Uri.parse(Config.settings!.radioLiveStream ?? ''),
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

  void enable() async {
    await floating.enable(OnLeavePiP());
  }

  void disable() async {
    await floating.cancelOnLeavePiP();
  }

  @override
  void dispose() {
    disable();
    // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
      floating: floating,
      childWhenEnabled: Scaffold(
          body:
              WebViewWidget(controller: viewController ?? WebViewController())),
      childWhenDisabled: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            print(_audioPlayer.processingState);
            var play = _audioPlayer.playing;
            print("playing: $play");
            if (_audioPlayer.playing) {
              await _audioPlayer.stop();
              print("stop");
            } else {
              await _audioPlayer.play();
              print("play");
            }
          },
          icon: Icon(Icons.podcasts_rounded),
          label: Text(AppLocalizations.of(context)!.audioBroadcast),
        ),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.liveNow,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: 30),
              liveStream(),
              Expanded(flex: (value - 1).abs(), child: SizedBox()),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (Config.settings != null)
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (Config.settings!.facebook != null)
                                buildSocialMediaButton(
                                  icon: FontAwesomeIcons.squareFacebook,
                                  url: Config.settings!.facebook!,
                                  context: context,
                                ),
                              if (Config.settings!.instagram != null)
                                buildSocialMediaButton(
                                  icon: FontAwesomeIcons.instagram,
                                  url: Config.settings!.instagram!,
                                  context: context,
                                ),
                              if (Config.settings!.twitter != null)
                                buildSocialMediaButton(
                                  icon: FontAwesomeIcons.xTwitter,
                                  url: Config.settings!.twitter!,
                                  context: context,
                                ),
                              if (Config.settings!.telegram != null)
                                buildSocialMediaButton(
                                  icon: FontAwesomeIcons.telegram,
                                  url: Config.settings!.telegram!,
                                  context: context,
                                ),
                              if (Config.settings!.youtube != null)
                                buildSocialMediaButton(
                                  icon: FontAwesomeIcons.youtube,
                                  url: Config.settings!.youtube!,
                                  context: context,
                                ),
                            ],
                          ),
                        ),
                      SizedBox(height: 30),
                      Expanded(
                        flex: 1,
                        child: Text(
                          AppLocalizations.of(context)!.copyright,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget audioBroadcast() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Expanded(
        flex: 1,
        child: AudioPlayerWidget(url: Config.settings!.radioLiveStream!),
      ),
    );
  }

  Widget liveStream() {
    return Container(
      width: double.infinity,
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: WebView(
        url: Config.webViewLive,
      ),
    );
  }

// IconButton buildSocialMediaButton({
//   required String url,
//   required IconData icon,
// }) =>
//     IconButton(
//       onPressed: () {
//         _launchUrl(Uri.parse(url));
//       },
//       icon: Icon(
//         icon,
//         size: 32,
//         color: Theme.of(context).colorScheme.secondary,
//       ),
//     );
//
// Future<void> _launchUrl(Uri url) async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }
}
