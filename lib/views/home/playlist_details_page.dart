import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/playlist_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/youtube_player.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';

class PlaylistDetailsPage extends StatefulWidget {
  PlaylistDetailsPage({super.key, required this.item});

  final PlaylistItems item;

  @override
  State<PlaylistDetailsPage> createState() => _PlaylistDetailsPageState();
}

class _PlaylistDetailsPageState extends State<PlaylistDetailsPage> {
  late Floating floating;

  @override
  void initState() {
    super.initState();
    floating = Floating();
    enable();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
      floating: floating,
      childWhenEnabled: CustomYouTubePlayer(
          id: widget.item.snippet?.resourceId?.videoId ?? ''),
      childWhenDisabled: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.item.snippet?.title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      getFormattedDate(widget.item.snippet?.publishedAt ?? '',
                          Localizations.localeOf(context).toLanguageTag()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: CustomYouTubePlayer(
                        id: widget.item.snippet?.resourceId?.videoId ?? ''),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectionArea(
                      child: HtmlWidget(
                        widget.item.snippet?.description ?? '',
                        renderMode: RenderMode.column,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
